# dotfiles

My system config.

[![Neovim plugins](https://dotfyle.com/danieldirks/dotfiles-home-privatedotconfig-nvim/badges/plugins?style=flat)](https://dotfyle.com/danieldirks/dotfiles-home-privatedotconfig-nvim)
[![License](https://img.shields.io/github/license/danieldirks/dotfiles)](./LICENSE)

## Installation

> **Warning**
> The install scripts will overwrite things on your system.
> Config is by no means stable.
> Don't set it up on your machine unless you know what you are doing.

Setup on Linux and MacOS:

```bash
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply danieldirks
```

Setup on Windows PowerShell:

```ps
(irm -useb https://get.chezmoi.io/ps1) | powershell -c -
bin/chezmoi init --apply danieldirks
```

See [chezmoi.io](https://www.chezmoi.io/) for different options and additional setup steps.

## Components

Some tools I use on a daily basis:

* [neovim](./home/private_dot_config/nvim/) - Customizable text editor
* [tmux](./home/dot_tmux.conf) - Terminal multiplexer
* [zsh](./home/dot_zshrc) - Shell

## License

The project is licensed under the [MIT License](./LICENSE).

