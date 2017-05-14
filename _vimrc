" $HOME/.vimrc

" syntax
syn on

" filetype
filetype on
filetype plugin on
filetype indent on

" look&feel
set number          " 行番号
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showmode
set showcmd         " display incomplete commands
set list            " display special characers
set listchars=tab:>-,extends:>,precedes:<,trail:-
set showmatch       " showmatch: Show the matching bracket for the last ')'?

" scroll
set nowrap          " 長い行は折り返す
set scrolloff=5     " 縦スクロール
set sidescroll=10   " 横スクロール

" tab/indent
set expandtab       " tabキーでスペースを挿入する
set softtabstop=4   " スペースの数は4
set autoindent      " インデントする
set tabstop=4       " タブ文字の幅も4
set shiftwidth=4    " >と<でインデント操作する幅も4
autocmd FileType make setlocal noexpandtab      " makefileはtab展開しない
autocmd FileType html setlocal ts=2 sts=2       " htmlは2tab

" search
set ignorecase      " 大文字小文字を無視する
set smartcase       " ただし、検索文字に大文字を含む場合を除く
set incsearch       " インクリメンタルサーチ(extra-searchが必要)
set hlsearch        " ハイライト(extra-searchが必要)
map <Esc><Esc>    :nohl<CR>
                    " esc2回でハイライト消す

" modeline
set modeline
set modelines=5

" help
set helplang=ja,en

