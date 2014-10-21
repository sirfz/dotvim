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
Re-run the above in case you ran a `pull` on the repo and it contained new submodule(s)

To install plugins, start vim and run:
```
:PluginInstall
```
