# PACKAGES

```sh
xbps-query -m > ~/dotfiles/void/packages.txt
```

```sh
sudo xbps-install -S $(cat ~/dotfiles/void/packages.txt)
```

# SERVICES

```sh
sudo chmod +x ~/dotfiles/void/services.sh && ./dotfiles/void/services.sh
```
# CONFIG SYMLINK

```sh
cd dotfiles
```

```sh
stow -v -t ~ nvim kitty sway yazi zsh fastfetch
```

Manually create symlink for the config files under *void* directory

```sh
ln -sf ~/dotfiles/void/etc/tlp.conf /etc/tlp.conf
```

