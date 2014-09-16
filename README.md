Installation:

    git clone git://github.com/sirfz/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule update --init

In case you pulled the repo and it contains new submodule(s):

    git submodule update --init bundle/<submodule-name>

For [jedi-vim](https://github.com/davidhalter/jedi-vim), you'll need to update it's submodule:

    cd ~/.vim/bundle/jedi-vim
    git submodule update --init
