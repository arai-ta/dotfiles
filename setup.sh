#!/bin/sh
#
# 新しい macOS マシンをまっさらな状態から立ち上げるブートストラップ。
#   1. Xcode Command Line Tools（git / make を含む）を導入し、完了まで待つ
#   2. Homebrew を導入する
#   3. このリポジトリを正規パスへ clone する
#   4. `make all` で dotfiles を home 以下へ展開する
#   5. Brewfile から各種ツールを導入する
#
# 使い方（リポジトリも git もまだ無い素の環境で、この1行だけ）:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/arai-ta/dotfiles/master/setup.sh)"
#
# curl | sh ではなく上の形を使うこと。sudo や Homebrew の対話入力のため
# stdin を端末につないだままにする必要がある（コマンド置換で渡すと stdin が残る）。

set -eu

REPO_URL="https://github.com/arai-ta/dotfiles"
DEST="$HOME/work/src/github.com/arai-ta/dotfiles"

# 1. Xcode Command Line Tools（git / make の実体）
#    `xcode-select --install` は GUI インストーラを出して即 return する非同期動作なので、
#    導入が完了するまでポーリングで待つ。
if ! xcode-select -p >/dev/null 2>&1 ;then
    echo "==> Xcode Command Line Tools を導入します"
    xcode-select --install || true
    printf "    インストール完了を待っています"
    until xcode-select -p >/dev/null 2>&1 ;do
        printf "."
        sleep 5
    done
    echo " 完了"
fi

# 2. Homebrew
if ! command -v brew >/dev/null 2>&1 ;then
    echo "==> Homebrew を導入します"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# この後の brew / brew bundle のために PATH を通す（Apple Silicon / Intel 両対応）。
if [ -x /opt/homebrew/bin/brew ] ;then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ] ;then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# 3. リポジトリ本体を正規パスへ（既にあれば更新）
if [ -d "$DEST/.git" ] ;then
    echo "==> リポジトリは既に $DEST にあります。最新へ更新します"
    git -C "$DEST" pull --ff-only
else
    echo "==> $DEST へ clone します"
    mkdir -p "$(dirname "$DEST")"
    git clone "$REPO_URL" "$DEST"
fi

# 4. dotfiles を展開する。
#    Makefile は $(PWD) からリンク先を組み立てるので、必ずリポジトリ内で実行する。
echo "==> make all で dotfiles を展開します"
cd "$DEST"
make all

# 5. Brewfile から各種ツールを導入する。
echo "==> brew bundle でツールを導入します"
brew bundle --file="$DEST/Brewfile"

echo "==> 完了。新しいシェルを開いて反映を確認してください。"
