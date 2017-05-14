#! /usr/bin/env make -f
# vi:noet

TARGETS = \
	~/.bashrc \
	~/.bash_profile \
	~/.gitconfig \
	~/.gitignore \
	~/.irbrc \
	~/.pythonrc \
	~/.screenrc \
	~/.vimrc \

help:
	@echo "Usage"
	@echo "  make       : show this help"
	@echo "  make diff  : check diff between existing files and here"
	@echo "  make raspi : install dotfiles for raspberry pi environment"
	@echo "  make all   : install all dotfiles"

diff :
	@for f in $(TARGETS) ;do \
		echo "========== $$f =========="; \
		diff -u $$f $(PWD)/`basename $$f | sed -e 's/^\./_/'`; \
	done

raspi : ~/.gitconfig ~/.gitignore ~/.vimrc

all : $(TARGETS)

#rule
$(HOME)/.% : _%
	rm -f $@
	ln -s $(PWD)/$< $@

