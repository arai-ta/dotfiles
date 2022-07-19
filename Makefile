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

help:
	@echo "Usage"
	@echo "  make       : show this help"
	@echo "  make diff  : check diff between existing files and here"
	@echo "  make raspi : install dotfiles for raspberry pi environment"
	@echo "  make all   : install all dotfiles"

diff :
	@for f in $(TARGETS) ;do \
		printf "Checking $$f ..."; \
		diff -u $$f "$(PWD)/_$${f#~/.}" && echo "No diff found."; \
	done

raspi : ~/.gitconfig ~/.gitignore ~/.vimrc

all : $(TARGETS)

#rule
$(HOME)/.% : _%
	mkdir -m 700 -p `dirname $@`
	rm -f $@
	ln -s $(PWD)/$< $@

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: Brewfile
Brewfile:
	brew bundle dump --force

xcodecli:
	-xcode-select --install
	sudo xcodebuild -license accept

