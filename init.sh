#!/bin/bash
#
# vim:syntax=sh:sw=4:ts=4:expandtab

mkdir ~/go
ln -s ~/dotfiles/dot.nvim ~/.nvim
ln -s ~/dotfiles/nvimrc ~/.nvim/.nvimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install python-dev python-pip
sudo pip install neovim

echo "source ~/dotfiles/bashrc_perso" >> ~/.bashrc
