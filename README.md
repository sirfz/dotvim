Installation:
```sh
git clone git://github.com/sirfz/dotvim.git ~/.vim
```
Create symlinks:
```sh
ln -s ~/.vim/vimrc ~/.vimrc
```
Switch to the `~/.vim` directory, and fetch submodules:
```sh
cd ~/.vim
git submodule update --init
```
In case you pulled the repo and it contains new submodule(s):
```sh
git submodule update --init bundle/<submodule-name>
```
For [jedi-vim](https://github.com/davidhalter/jedi-vim), you'll need to update it's submodule:
```sh
cd ~/.vim/bundle/jedi-vim
git submodule update --init
```
