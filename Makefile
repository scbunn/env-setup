HOMEBREW_INSTALL := $(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
WORKING_DIR=$(shell pwd)

homebrew:
	/usr/bin/ruby -e "$(HOMEBREW_INSTALL)"
	brew install --build-from-source ctags bash zsh gnupg go htop jq python python@2 shellcheck tmux vim zsh-autosuggestions zsh-completions zsh-syntax-highlighting
	pip3 install --upgrade pip
	pip3 install httpie flake8 jedi pycodestyle
vim-config:
	mkdir -p ~/.vim
	ln -sf $(WORKING_DIR)/vim/vimrc ~/.vimrc
	ln -sf $(WORKING_DIR)/vim/vimrc.local ~/.vimrc.local
	ln -sf $(WORKING_DIR)/vim/vimrc.local.bundles ~/.vimrc.local.bundles
vim-clean:
	rm -rf ~/.vim/bundle
	rm -rf ~/.vim/plugged
vim-install: vim-clean vim-config
	curl 'http://vim-bootstrap.com/generate.vim' --data 'langs=python&langs=go&langs=javascript&langs=html&editor=vim' > ~/.vim/vimrc
	vim +PlugInstall +qall
