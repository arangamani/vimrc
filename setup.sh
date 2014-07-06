#!/bin/bash

echo "Setting up vim..."

timestamp=$(date +"%Y%m%d%H%M")
if [ -d ~/.vim ];
then
    echo "Taking a backup of existing vim setup.."
    mv ~/.vim ~/.vim.$timestamp
fi

echo "Cloning to arangamani/vimrc"
git clone git://github.com/arangamani/vimrc ~/.vim

echo "Installing Vundle first..."
if [ ! -e $HOME/.vim/bundle/vundle ]; then
  mkdir -p $HOME/.vim/bundle
  git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
else
  cd $HOME/.vim/bundle/vundle && git pull
fi

echo "Installing all the bundles with vundle..."
vim -u $HOME/.vimr/startup/bundles.vim +BundleInstall! +BundleClean +qall

if [ -f ~/.vimrc ];
then
    echo "Deleting old symlink"
    rm ~/.vimrc
fi

ln -s ~/.vim/vimrc ~/.vimrc

echo "Completed setup of vim..."
