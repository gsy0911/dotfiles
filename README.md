# dotfiles

- [![maintained](https://img.shields.io/maintenance/yes/2025?label=maintained)](https://github.com/gsy0911/dotfiles/commits/main)
- [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
- [![macOS](https://img.shields.io/badge/macOS_Sequoia-15.3-green.svg)]()
- [![aerospace](https://img.shields.io/badge/window-aerospace-green.svg)]()
- [![wezterm](https://img.shields.io/badge/terminal-wezterm-green.svg)]()
- [![zsh](https://img.shields.io/badge/shell-zsh-green.svg)]()


dotfiles of @gsy0911.

The repository-references is [here](./REFERENCES.md).

# initial-setup

Initial set up is [here](./INITIAL_SETTING.md).

# setup

```shell
# new installation
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# install required packages via brew
$ task nix
```


# other initial-setup

```
# install claude-code
$ npm install -g @anthropic-ai/claude-code
```

# check

```shell
$ time zsh -i -c exit
@ 2024/12/05
zsh -i -c exit  0.06s user 0.07s system 75% cpu 0.169 total

$ nvim --startuptime startuptime.log +q
@ 2025/02/08
137.421  000.020: --- NVIM STARTED ---
```

# XGD Base Directory

```shell
$ brew install --formula xdg-ninja
```
