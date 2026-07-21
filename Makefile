#! /usr/bin/env make -f
# vi:noet

TARGETS = \
	~/.bashrc \
	~/.bash_profile \
	~/.gitconfig \
	~/.gitignore \
	~/.screenrc \
	~/.sqliterc \
	~/.vimrc \
	~/.peco/config.json \
	~/.aws/cli/alias \
	~/.config/ghostty/config \
	~/.claude/CLAUDE.md \
	~/.claude/settings.json \

# ディレクトリはルールが違う
DIR_TARGETS = \
	~/.claude/skills \

help:
	@echo "Usage"
	@echo "  make       : show this help"
	@echo "  make diff  : check diff between existing files and here"
	@echo "  make raspi : install dotfiles for raspberry pi environment"
	@echo "  make all   : install all dotfiles"

diff :
	@for f in $(TARGETS) $(DIR_TARGETS) ;do \
		printf "Checking $$f ..."; \
		diff -ru $$f "$(PWD)/_$${f#~/.}" && echo "No diff found."; \
	done

raspi : ~/.gitconfig ~/.gitignore ~/.vimrc

all : $(TARGETS) $(DIR_TARGETS)

# ファイル向けルール
$(HOME)/.% : _%
	mkdir -m 700 -p `dirname $@`
	rm -f $@
	ln -s $(PWD)/$< $@

# ディレクトリ向けルール
.PHONY: $(DIR_TARGETS)
$(DIR_TARGETS) :
	mkdir -m 700 -p $(dir $@)
	rm -rf $@
	ln -s $(PWD)/$(patsubst $(HOME)/.%,_%,$@) $@

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: Brewfile
Brewfile:
	brew bundle dump --force

xcodecli:
	-xcode-select --install
	sudo xcodebuild -license accept

