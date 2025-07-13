all: nvim tmux kerl kiex

.PHONY: nvim tmux kerl kiex

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

kerl:
	mkdir -p $(HOME)/.kerl/bin
	curl -sSL https://raw.githubusercontent.com/kerl/kerl/master/kerl -o $(HOME)/.kerl/bin/kerl
	chmod +x $(HOME)/.kerl/bin/kerl

kiex:
	curl -sSL https://raw.githubusercontent.com/taylor/kiex/master/install | bash -s

other:
	stow --target $(HOME) bash git kube zsh
