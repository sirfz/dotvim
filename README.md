### Requirements:

* neovim > 0.7
* git (not too old, for Packer)
* `pip install ruff black pynvim` (for null-ls Python linting/formatting)
* fzf, ripgrep and fd for fzf-lua
    ```
    sudo apt install ripgrep fd-find
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    ```
* [Node.js](https://github.com/nodesource/distributions#debian-and-ubuntu-based-distributions) (for Mason to install language servers/tools)
    1. Download and import the Nodesource GPG key
    ```
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    ```
    2. Create deb repository
    ```
    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
    ```
    3. Run Update and Install
    ```
    sudo apt-get update
    sudo apt-get install nodejs -y
    ```
    
* ~sqlite3-dev (for Telescope-frecency)~
    ```
    sudo apt install libsqlite3-dev
    ```

### Installation:

```sh
git clone https://github.com/sirfz/dotvim.git ~/.config/nvim
```

To install all plugins, just run neovim (lazy.nvim will automatically install all plugins):

```sh
vim
```

### Tmux

recommended config:

```
# nvim recommended
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
set -sg escape-time 10
set -g focus-events on
# ctrl+arrows enabled (not needed?)
set-window-option -g xterm-keys on
# vi key bindings
set-window-option -g mode-keys vi
# disable statusline
set -g status off
# binds (closer to gnu screen)
unbind C-b
set -g prefix C-a
bind-key C-a last-window  # screen behavior
bind-key Space next-window
bind-key BSpace previous-window
# undercurl
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
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
        attribute-defined-outside-init,
```
