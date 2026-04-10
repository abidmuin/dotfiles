# ~/.zshrc

# BEGIN_COLOR
## sudo xbps-install vivid
# export LS_COLORS="$(vivid generate gruvbox-dark)"

## BEGIN_ZSH_AUTOCOMPLETE
### sudo xbps-install zsh-completions
fpath=(/usr/share/zsh/site-functions /usr/share/zsh/functions $fpath)

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
## END_ZSH_AUTOCOMPLETE
# END_COLOR

# BEGIN_ZOXIDE
# sudo xbps-install zoxide
eval "$(zoxide init zsh)"
# END_ZOXIDE

# BEGIN_SETTINGS_PARAMS
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt hist_ignore_dups
# END_SETTINGS_PARAMS

# BEGIN_ALIAS
## FILE / DIRECTORY
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias cat='bat'
alias cd='z'

## GIT
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

## OS
alias bye='shutdown -P now'

## MPV MUSIC
alias pause='echo "cycle pause" | socat - /tmp/mpvsocket'
alias volume-up='echo "add volume 5" | socat - /tmp/mpvsocket'
alias volume-down='echo "add volume -5" | socat - /tmp/mpvsocket'

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

# BEGIN_ZSH_PLUGINS
[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## BEGIN_FZF 
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --color=bw"
## END_FZF
# END_ZSH_PLUGINS

# BEGIN_ENV
export WLR_DRM_NO_MODIFIERS=1
export MOZ_ENABLE_WAYLAND=1
export EDITOR="nvim"
# END_ENV

# BEGIN_GPG
export GPG_TTY=$(tty)
if command -v gpg-connect-agent >/dev/null; then
    gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1
fi
# END_GPG

# BEGIN_SWAY_AUTOSTART
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi
# END_SWAY_AUTOSTART

# BEGIN_YAZI
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# END_YAZI

# BEGIN_YT_DLP
## Usage: play "song name" or play "https://youtube.com/..."
## AUDIO ONLY 
function play() {
  query="$*"
  selection=$(yt-dlp "ytsearch10:$query" \
        --get-title --get-id --default-search "ytsearch" \
        --flat-playlist | sed 'N;s/\n/ - /' | fzf --height 40% --reverse --border)

if [ -n "$selection" ]; then
        video_id=$(echo "$selection" | awk -F ' - ' '{print $NF}')
        echo "Playing: $selection"
        mpv --no-video \
          --ytdl-format="bestaudio" \
          --ytdl-raw-options="yes-playlist=" \
          --input-ipc-server=/tmp/mpvsocket \
          "https://www.youtube.com/watch?v=${video_id}&list=RD${video_id}"
fi
}
# END_YT_DLP

# BEGIN_NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# END_NVM

# BEGIN_RUST
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
# END_RUST

# BEGIN_EVALS
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
# END_EVALS

# YEE_HAW!
fastfetch


