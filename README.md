# dotfiles

My dotfiles.

## Setup

```bash
# linux and macos
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply danieldirks
```

```ps
# windows
(irm -useb https://get.chezmoi.io/ps1) | powershell -c -
bin/chezmoi init --apply danieldirks
```

System packages and binaries [on their website](https://www.chezmoi.io/install/). To update dotfiles, run `chezmoi update`.

### Safe mode

In safe mode, the setup has to be done manually. See [.chezmoidata.toml](home/.chezmoidata.toml), [.chezmoiexternal.toml.tmpl](home/.chezmoiexternal.toml.tmpl) and [.chezmoiscripts/setup/](home/.chezmoiscripts/setup/) for external resources and package installation.
