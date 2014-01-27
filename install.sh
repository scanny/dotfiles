#!/bin/bash

function establish_symlink {
    name=$1
    target=$2
    if ! [ -L ${name} ]; then
        ln -s ${target} ${name}
    fi
}

establish_symlink ~/.config     ~/.dotfiles/link/.config
establish_symlink ~/.dircolors  ~/.dotfiles/link/.dircolors
establish_symlink ~/.githelpers ~/.dotfiles/link/.githelpers

establish_symlink ~/.vim        ~/.dotfiles/link/.vim
establish_symlink ~/.vimrc      ~/.dotfiles/link/.vimrc

establish_symlink ~/.zsh        ~/.dotfiles/link/.zsh
establish_symlink ~/.zshenv     ~/.dotfiles/link/.zshenv
establish_symlink ~/.zshrc      ~/.dotfiles/link/.zshrc

# clone Vundle
# --------------------------------------
if ! [ -d ~/.dotfiles/link/.vim/bundle/vundle ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
