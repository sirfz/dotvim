### Requirements:

* vim8 built with Python 3.6+
* [fd](https://github.com/sharkdp/fd) for CtrlP search
* `pip3 install --user pynvim` (for deoplete.nvim)
* `sudo pip install flake8 pylint` (for ale python ailnting)

### Installation:

```sh
git clone git://github.com/sirfz/dotvim.git ~/.vim
```

##### Create symlinks:
```sh
ln -s ~/.vim/vimrc ~/.vimrc
```
To install all plugins, run (using vim-plug):
```sh
vim +PlugUpdate
```
