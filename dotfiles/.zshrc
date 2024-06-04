# Path to your oh-my-zsh installation.
export ZSH=/home/hugo/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="refined"

# Enable true colors
export COLORTERM=truecolor

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize github tmux zsh-syntax-highlighting zsh-history-substring-search)

# User configuration

# vi mode
# bindkey -v
# export KEYTIMEOUT=1

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:~/bin/:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

source /home/hugo/.bash_aliases

# Enable jumping forward and backward one word with CTRL+left/right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/home/hugo/.poetry/bin:/home/hugo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completionexport 
