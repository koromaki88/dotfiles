# dotfiles
Self-explanatory

Basic info:
- Arch Linux
- [AwesomeWM](https://github.com/deficient/deficient)/[i3(blocks)](https://github.com/a-schaefers/i3-wm-gruvbox-theme)
- zsh w/ manual p10k install, tmux. Plugins: zsh-autosuggestions & zsh-syntax-highlighting
- ~Floorp/Brave/qutebrowser~ all roads lead back to Firefox
- Alacritty/Kitty
- rofi w/ [adi1090x's theme](https://github.com/adi1090x/rofi) type 4, style 4 launcher, no applet & powermenu + installed [rofi-calc](https://github.com/svenstaro/rofi-calc)

## Firefox
- [Arkenfox](https://github.com/arkenfox/user.js)
- Disable 'Alt' key: `ui.key.menuAccessKeyFocuses = false`

## Neovim
> Original Template: [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

- [tree-sitter-latex](https://github.com/latex-lsp/tree-sitter-latex) requires [tree-sitter-cli](https://archlinux.org/packages/extra/x86_64/tree-sitter-cli/). Using [render-markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) in which latex requires [python-pylatexenc](https://archlinux.org/packages/extra/any/python-pylatexenc/)

For `~/scripts/`: Make symlinks using `ln -s /path/to/scripts/* ~/.local/bin/` (or whatever preferred).

For SDDM theme `sddm-eucalyptus-drop` move into `/usr/share/sddm/themes/` and change `[Theme]` in `/etc/sddm.conf.d/default.conf` (cp from `/usr/lib/sddm/sddm.conf.d/default.conf` if doesn't already exist). On Arch, install [qt6-5compat](https://archlinux.org/packages/extra/x86_64/qt6-5compat/) for dependencies
