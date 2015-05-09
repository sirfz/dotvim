Installation:
```sh
git clone git://github.com/sirfz/dotvim.git ~/.vim
```
Create symlinks:
```sh
ln -s ~/.vim/vimrc ~/.vimrc
```
Switch to the `~/.vim` directory, and fetch submodules (mainly Vundle):
```sh
cd ~/.vim
git submodule update --init --recursive
```
To install all plugins, run:
```sh
vim +PluginInstall
```
Compile vimproc in ~/.vim/bundle/vimproc.vim:
```sh
cd ~/.vim/bundle/vimproc.vim && make
```
