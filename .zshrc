# General shell environment variables
source ~/.env

# Source any user secrets
source ~/.secrets

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
ZSH_THEME="wolfe"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Use the dotfiles repo .zsh-custom
ZSH_CUSTOM=$DOTFILES_DIR/.zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cf)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# User configuration

export HISTSIZE=100000 SAVEHIST=100000

mkdir -p "$HOME/.zsh_logs"
function precmd() {
    if [ "$(id -u)" -ne 0 ]; then
        FULL_CMD_LOG="$HOME/.zsh_logs/zsh-history-$(date -u "+%Y-%m-%d").log"
        echo "$USER@`hostname`:`pwd` [$(date -u)] `\history -1`" >> ${FULL_CMD_LOG}
    fi
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
source ~/.aliases

source ~/.tools
