# Path to your oh-my-zsh installation.
export ZSH=/home/hugo/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="refined"

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
plugins=(git colorize github tmux zsh-syntax-highlighting vi-mode)

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

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# pyenv stuff
export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source /home/hugo/.bash_aliases
source ~/.bashrc.bastion.sh
#source /home/hugo/.shell_functions
#source /home/hugo/.envars

# Enable jumping forward and backward one word with CTRL+left/right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word


#####################################################################################
### Start a tmux session, unless there is already one, in which case attach to it ###
#####################################################################################
#
# if [[ "$TERM" != "screen" ]] &&
#         [[ "$SSH_CONNECTION" == "" ]]; then
#     # Attempt to discover a detached session and attach
#     # it, else create a new session

#     WHOAMI=$(whoami)
#     if tmux has-session -t $WHOAMI 2>/dev/null; then
#         tmux -2 attach-session -t $WHOAMI
#     else
#         tmux -2 new-session -s $WHOAMI
#     fi
# else

#     # One might want to do other things in this case,
#     # here I print my motd, but only on servers where
#     # one exists

#     # If inside tmux session then print MOTD
#     MOTD=/etc/motd.tcl
#     if [ -f $MOTD ]; then
#         $MOTD
#     fi
# fi
export PATH="/home/hugo/google-cloud-sdk/bin:/usr/bin:/bin:/usr/sbin:/sbin:/home/hugo/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
export PATH=$PATH:$JAVA_HOME/bin/


# MLFlow creds
export MLFLOW_TRACKING_USERNAME=delphia-ds
export MLFLOW_TRACKING_PASSWORD=svuNNctvZzZPQgA6NKGLfxsj

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/hugo/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/hugo/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/hugo/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/hugo/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Set Python binary for Google Cloud SDK
export CLOUDSDK_PYTHON=/usr/bin/python
# Use GKE auth for kubectl
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
export DBT_PROFILES_DIR=/home/hugo/delphia/projects/sig-dbt
export DBT_PROFILES_DIR=/home/hugo/delphia/projects/sig-dbt
export DELPHIA_EMAIL=hugo@delphia.com
export DBT_PROFILES_DIR=/home/hugo/delphia/projects/sig-dbt
export DELPHIA_EMAIL=hugo@delphia.com
