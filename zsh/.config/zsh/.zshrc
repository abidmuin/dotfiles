# ~/.zshrc

eval "$(zoxide init zsh)"

# BEGIN_SETTINGS_PARAMS
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_dups
# END_SETTINGS_PARAMS

# BEGIN_ALIAS
## FILE / DIRECTORY
alias ll='ls -la'
alias cat='bat'
alias cd='z'

## GIT
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

## OS
alias bye='shutdown -P now'

## BEGIN_SUDO_MACRO
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line
## END_SUDO_MACRO

# END_ALIAS

# BEGIN_PLUGINS
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF initialization
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# END_PLUGINS

# BEGIN_ENV
export MOZ_ENABLE_WAYLAND=1
export EDITOR="nvim"
# END_ENV

# BEGIN_GPG
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
# END_GPG

# Auto-start Sway on TTY1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi

# BEGIN_EVALS
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
# END_EVALS
