all: nvim tmux

.PHONY: nvim tmux

nvim: nvim-install nvim-deps
	stow --target $(HOME)/.config nvim

nvim-install:
	dpkg-query -W neovim || sudo apt install neovim

nvim-deps:

tmux: tmux-install tmux-deps
	stow --target $(HOME)/.config tmux

tmux-install:
	dpkg-query -W tmux || sudo apt install tmux

tmux-deps:

other:
	stow --target $(HOME) bash git kube zsh
