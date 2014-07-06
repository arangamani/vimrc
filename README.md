# Arangamani's vimrc

## Installation

### cURL

```bash
curl https://raw.githubusercontent.com/arangamani/vimrc/master/setup.sh | bash
```

### Manual

```bash
# Clone the vimrc repository to ~/.vim
git clone git://github.com/arangamani/vimrc ~/.vim

# Install vundle first
mkdir -p $HOME/.vim/bundle
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

# Install all other bundles using vundle installer
vim -u $HOME/.vim/startup/bundles.vim +BundleInstall! +BundleClean +qall

# Link the vimrc
ln -s ~/.vim/vimrc ~/.vimrc
```
