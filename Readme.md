# AstroVim Config

This follows the instructions found at <https://astronvim.github.io/configuration/manage_user_config>. When setting up a new system do the following.

## Fresh Installation

```shell
rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

**Note:** If the user config is already in place you have to rename it.

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
# normal
nvim +PackerSync
# or headless
# nvim  --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

### User config

```shell
git clone https://github.com/gabyx/astrovim.git ~/.config/nvim/lua/user
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

Test the settings now that the user config is in place.

### Optional unattended install

Instead of running nvim +PackerSync to initialize AstroNvim you can run the following command to do a fully headless initialization:

Full Steps:

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone git@github.com:ericlake/astrovim_config.git ~/.config/nvim/lua/user
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```
