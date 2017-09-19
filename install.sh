#!/bin/sh

set -x
set -e

if [ ! -x instal.sh ]; then
	echo "Run this from vim-settings repo dir"
fi

git submodule init
git submodule update

mkdir -p $(pwd)/.vim/autoload
ln -sf $(pwd)/.vim/vim-pathogen/autoload/pathogen.vim $(pwd)/.vim/autoload

mv ~/.vimrc ~/.vimrc.old || true
mv ~/.vim ~/.vim.old || true

ln -sf $(pwd)/.vim ~/.vim
ln -sf $(pwd)/.vimrc ~/.vimrc
