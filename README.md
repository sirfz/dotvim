### Requirements:

* neovim > 0.7
* git (not too old, for Packer)
* `pip3 install --user ruff pylint perflint black` (for null-ls Python linting/formatting)
* ripgrep and fd for Telescope
* node (for Mason to isntall language servers)
* sqlite3-dev (for Telescope-frecency)

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
unbind C-b
set -g prefix C-a
# disable statusline
set -g status off
# binds
bind-key C-a last-window  # screen behavior
bind-key Space next-window
bind-key Backspace previous-window
# vi key bindings
set-window-option -g mode-keys vi
set-option -g default-terminal "screen-256color"
set-option -sa terminal-overrides ',xterm-256color:RGB'
set-option -sg escape-time 10
set-window-option -g xterm-keys on
```

### pylint

~/.pylintrc:

```
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
        too-many-statements
```
