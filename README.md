dotvim
======

Install
-------

```
cd ~
git clone https://github.com/nostalgiaz/.vim.git .vim
git clone https://github.com/gmarik/vundle.git .vim/bundle/vundle
ln -s .vim/vimrc .vimrc
mkdir .tmp
vim -u .vim/bundles.vim +BundleInstall +q
```
