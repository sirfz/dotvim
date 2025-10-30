### Requirements:

* neovim >= 0.11
* git (not too old, for package management)
* full setup with [mise](https://mise.jdx.dev/)
    ```
    curl https://mise.run | sh
    # mise/fzf shell integration
    echo 'eval "$(~/.local/bin/mise activate bash)"' >> ~/.bashrc
    echo 'eval "$(fzf --bash)"' >> ~/.bashrc
    echo 'export FZF_DEFAULT_COMMAND="fd --type f"' >> ~/.bashrc
    # activate mise
    eval "$(~/.local/bin/mise activate bash)"
    # install tools
    mise u -g rust@nightly node@22 rg fd bat fzf uv neovim
    # language servers
    mise u -g pipx:ty pipx:pyrefly pipx:basedpyright pipx:ruff npm:@github/copilot-language-server opencode
    ```
    ```

### Installation:

```sh
git clone https://github.com/sirfz/dotvim.git ~/.config/nvim
```

To install all plugins, just run neovim (lazy.nvim will automatically install all plugins):

```sh
vim
```

### alias vim to nvim (system-wide)

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/nvim 60
sudo update-alternatives --config editor
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
bind-key a send-prefix
bind-key C-a last-window  # screen behavior
unbind space
bind-key space next-window
bind-key BSpace previous-window
# undercurl
set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
```

### ruff/basedpyright default config

pyproject.toml:

```toml
[tool.basedpyright]
typeCheckingMode = "off"
reportUnusedImport = false

[tool.ruff]
line-length = 120
select = ["E", "F", "A", "UP", "PIE", "PLC", "PLE", "PLR", "PLW", "RUF"]
ignore = ["E741"]
```

### GNU Screen 5 with truecolor support

#### Pre-requisites

```bash
sudo apt update && sudo apt install -y git autoconf automake libtool make gcc libncurses5-dev libpam0g-dev libssl-dev
```

#### Build and install

```bash
git clone https://git.savannah.gnu.org/git/screen.git
cd screen/src
NOCONFIGURE=1 ./autogen.sh
sh ./configure \
    --prefix=/usr/local \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --enable-pam \
    --enable-telnet
make
sudo make install
```

#### Configure .screenrc

```
# this config requires Screen v5 (-git master branch release)
truecolor on
hardstatus off # puts notifications at the bottom
# hardstatus alwaysfirstline '%{#999999}[ GNU screen ]%{#ffffff} %< %{7}%?%-Lw%?%{1;0}%{#009dff}(== %{#ffffff}%n %h%?(%u)%?%{1;0}%{#009dff} ==)%{7}%?%+Lw%?%?'
altscreen on
bind 0 select 10
bind c screen 1
defscrollback 5000
maptimeout 0
screen 1
startup_message off
```

reference: https://dev.to/kj_sh604/my-simple-gnu-screen-set-up-tmux-alternative-41j0
