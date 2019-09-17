HOMEBREW_INSTALL := $(shell curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
WORKING_DIR=$(shell pwd)

.PHONY: zsh

homebrew:
	/usr/bin/ruby -e "$(HOMEBREW_INSTALL)"
	brew install ctags bash zsh gnupg go htop jq python python@2 shellcheck tmux vim zsh-autosuggestions zsh-completions zsh-syntax-highlighting bat fzf go golangci-lint goreleaser kubernetes-cli kubernetes-helm vault
	pip3 install --upgrade pip
	pip3 install httpie flake8 jedi pycodestyle
vim-config:
	mkdir -p ~/.vim
	ln -sf $(WORKING_DIR)/vim/vimrc ~/.vimrc
vim-clean:
	rm -rf ~/.vim
vim-install: vim-clean vim-config
	vim +PlugInstall +qall

zsh:
	rm -rf ~/.zshrc
	ln -sf $(WORKING_DIR)/zsh/zshrc ~/.zshrc
