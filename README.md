### Requirements:

* vim8/neovim with Python 3.6+ support
* `pip3 install --user pynvim` (for deoplete.nvim)
* `pip3 install --user jedi` (for deoplete-jedi)
* `pip3 install --user flake8 pylint` (for ale Python linting)
* ~~[fd](https://github.com/sharkdp/fd) for CtrlP search~~ (switched LeaderF)

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
