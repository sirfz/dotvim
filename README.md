### Requirements:

* neovim > 0.7
* git (not too old, for Packer)
* `pip3 install --user ruff pylint perflint black` (for null-ls Python linting/formatting)
* ripgrep and fd for Telescope
    ```
    sudo apt install ripgrep fd-find
    ```
* node (for Mason to isntall language servers)
    ```
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
    sudo apt-get install -y nodejs
    ```
* sqlite3-dev (for Telescope-frecency)
    ```
    sudo apt install libsqlite3-dev
    ```

### Installation:

```sh
git clone https://github.com/sirfz/dotvim.git ~/.config/nvim
```

To install all plugins, run (using vim-plug):

```sh
vim +PackerSync
```

### Tmux

recommended config:

```
# nvim recommended
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
set -sg escape-time 10
# ctrl+arrows enabled (not needed?)
set-window-option -g xterm-keys on
# vi key bindings
set-window-option -g mode-keys vi
# disable statusline
set -g status off
# binds (screen-like)
unbind C-b
set -g prefix C-a
bind-key C-a last-window  # screen behavior
bind-key Space next-window
bind-key BSpace previous-window
```

### pylint

~/.pylintrc:

```
extension-pkg-allow-list=orjson

disable=raw-checker-failed,
        bad-inline-option,
        locally-disabled,
        file-ignored,
        suppressed-message,
        useless-suppression,
        deprecated-pragma,
        use-symbolic-message-instead,
        unused-argument,
        inconsistent-return-statements,
        invalid-name,
        too-many-lines,
        missing-module-docstring,
        wrong-import-order,
        line-too-long,
        missing-function-docstring,
        undefined-variable,
        too-many-locals,
        too-many-branches,
        too-many-statements,
        unused-import,
        ungrouped-imports,
        missing-class-docstring,
        too-few-public-methods,
        too-many-instance-attributes,
        unused-variable,
```
