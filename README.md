# dotfiles

[![maintained](https://img.shields.io/maintenance/yes/2024?label=maintained)](https://github.com/gsy0911/dotfiles/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![macOS](https://img.shields.io/badge/macOS_Sonoma-14.4-green.svg)]()
[![zsh](https://img.shields.io/badge/shell-zsh-green.svg)]()


dotfiles of @gsy0911.

The repository-references is [here](./REFERENCES.md).

# initial-setup

Initial set up is [here](./INITIAL_SETTING.md).

# setup

```shell
# install required packages via brew
$ task ansible
```

# install

```shell
# create symbolic linc
# add .zshrc
$ task dotfile
```

# check

```shell
$ time zsh -i -c exit
@ 2024/12/05
zsh -i -c exit  0.06s user 0.07s system 75% cpu 0.169 total
```

