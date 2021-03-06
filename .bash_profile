#!/bin/bash

# Bash-specific configuration
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# General shell environment variables
source ~/.env

source ~/.secrets

# General shell aliass
source ~/.aliases

# General shell tool setup
source ~/.plugins

# Bash interactive shell configuration
source ~/.bashrc

# Bash-specific tool setup
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi