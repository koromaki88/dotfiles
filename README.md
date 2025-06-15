# dotfiles
Self-explanatory

Basic info:
- Arch Linux
- [AwesomeWM](https://github.com/deficient/deficient)/[i3(blocks)](https://github.com/a-schaefers/i3-wm-gruvbox-theme)
- zsh w/ manual p10k install, tmux. Plugins: zsh-autosuggestions & zsh-syntax-highlighting
- Firefox/Brave/qutebrowser
- Alacritty
- [Neovim](https://github.com/nvim-lua/kickstart.nvim)

For `~/scripts/`: Make symlinks using `cp -Rs path/to/scripts/ ~/.local/bin/` (or whatever preferred).

For SDDM theme `sddm-eucalyptus-drop` move into `/usr/share/sddm/themes/` and change `[Theme]` in `/etc/sddm.conf.d/default.conf` (cp from `/usr/lib/sddm/sddm.conf.d/default.conf` if doesn't already exist). On Arch, install qt6-5compat for dependencies
