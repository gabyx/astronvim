# AstroVim Config

This follows the instructions found at <https://astronvim.github.io/configuration/manage_user_config>. When setting up a new system do the following.

## Requirements

See here [https://astronvim.github.io/nightly#-requirements](https://astronvim.github.io/nightly#-requirements).

## Fresh Installation

```shell
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

**Note:** If the user config is already in place you have to rename it.

```shell
git clone --depth 1 --branch nightly https://github.com/AstroNvim/AstroNvim ~/.config/nvim
# Start nvim or use the unattended method:
nvim  --headless -c 'autocmd User LazyDone quitall'
```

### User Config

```shell
git clone https://github.com/gabyx/astrovim.git ~/.config/nvim/lua/user
# Start nvim or use the unattended method:
nvim  --headless -c 'autocmd User LazyDone quitall'
```

Restart `nvim` and check that `lazy` installed all packages.
