#!/bin/bash

function establish_symlink {
    name=$1
    target=$2
    if ! [ -L ${name} ]; then
        ln -s ${target} ${name}
    fi
}

# --- ensure `~/.config` directory exists ---
mkdir -p ~/.config

establish_symlink ~/.config/flake8  ~/.dotfiles/link/.config/flake8
establish_symlink ~/.config/git     ~/.dotfiles/link/.config/git
establish_symlink ~/.config/nvim    ~/.dotfiles/link/.config/nvim
establish_symlink ~/.dircolors      ~/.dotfiles/link/.dircolors
establish_symlink ~/.githelpers     ~/.dotfiles/link/.githelpers

establish_symlink ~/.vim            ~/.dotfiles/link/.vim
establish_symlink ~/.vimrc          ~/.dotfiles/link/.vimrc

establish_symlink ~/.zsh            ~/.dotfiles/link/.zsh
establish_symlink ~/.zshenv         ~/.dotfiles/link/.zshenv
establish_symlink ~/.zshrc          ~/.dotfiles/link/.zshrc
