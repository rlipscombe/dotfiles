all: nvim tmux

.PHONY: nvim tmux

UNAME_S := $(shell uname -s)

nvim: nvim-install nvim-deps
	stow --target $(HOME)/.config nvim

nvim-install: nvim-install-$(UNAME_S)

nvim-install-Linux:
	dpkg-query -W neovim || sudo apt install neovim

nvim-install-Darwin:
	brew list neovim || brew install neovim

nvim-deps:

tmux: tmux-install tmux-deps
	stow --target $(HOME)/.config tmux

tmux-install: tmux-install-$(UNAME_S)

tmux-install-Linux:
	dpkg-query -W tmux || sudo apt install tmux

tmux-install-Darwin:
	brew list tmux || brew install tmux

tmux-deps:

other:
	stow --target $(HOME) bash git kube zsh
