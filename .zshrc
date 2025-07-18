export TERMINAL="kitty"

if [[ -o interactive ]]; then
    fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh built-in autocomplete
autoload -Uz compinit
compinit
# pacman -S zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#928374"
# pacman -S zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ~/.zshrc: executed by zsh for non-login shells.
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_ignore_all_dups  # ignore both duplicates
setopt hist_ignore_space    # ignore lines starting with space
setopt append_history       # append to history rather than overwrite

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
ibus-daemon -rxRd

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias fzf-nv='find . | nvim $(fzf --preview="bat --color=always {}")' # fzf + nvim interactive
alias fzf-tn='thunar $(dirname "$(find . | fzf)")' # fzf + thunar
alias fzf-cd='selected=$(find . | fzf --preview="bat --color=always {}"); if [ -d "$selected" ]; then cd "$selected"; else cd "$(dirname "$selected")"; fi' # fzf cd
# Search all in user
alias fzf-nva='find ~ | nvim $(fzf --preview="bat --color=always {}")' # fzf + nvim interactive
alias fzf-tna='thunar $(dirname "$(find ~ | fzf)")' # fzf + thunar
alias fzf-cda='selected=$(find ~ | fzf --preview="bat --color=always {}"); if [ -d "$selected" ]; then cd "$selected"; else cd "$(dirname "$selected")"; fi' # fzf cd

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Start tmux on every shell login and check:
# 1. tmux exits on the system
# 2. in an interactive shell
# 3. tmux doesn't try to run within itself
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=/home/teio/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/home/teio/.local/share/flatpak/exports/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl

eval $(keychain --eval --quiet ~/.ssh/gh_desktop)

# bun completions
[ -s "/home/teio/.bun/_bun" ] && source "/home/teio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
