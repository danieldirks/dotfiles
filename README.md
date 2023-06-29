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

In safe mode setup scripts are skipped. To generate and run setup scripts manually, select the files from [.chezmoiscripts/setup](home/.chezmoiscripts/setup/) and run:

```sh
cat <path/to/file>.tmpl | chezmoi execute-template > script
```
