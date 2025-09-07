#
export ZSH_C=~/.config/zsh
export ZSH_SH_CONF=$ZSH_C/conf
export UNAME=$(uname)

# What is this for?
path+=("${HOME}/.local/bin")
# Provides path for zellij
path+=("${HOME}/.cargo/bin/")
#export PATH="/opt/nvim-linux64/bin:$PATH"
# Provides path for ruby gems
path+=("${HOME}/bin")
# Not sure but personal binaries, maybe?
path+=("${HOME}/.bin")
# MacOS / Darwin Binaries
if [[ ${UNAME} == 'Darwin' ]]; then
    path+="$PATH:/sbin"
fi

HISTFILE=~/.history
HISTSIZE=25000
SAVEHIST=25000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
setopt HISTIGNOREALLDUPS sharehistory
export WORDCHARS='*?_.[]~&;!#$%^(){}<>'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export GCM_CREDENTIAL_STORE=gpg

#EDITOR=/opt/nvim-linux64/bin/nvim
EDITOR=/usr/local/bin/nvim

# prompt
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    PROMPT_HOSTNAME="@%F{37}%m"
fi
PROMPT="%B%F{214}%n%F{154}${PROMPT_HOSTNAME}%b%F{210}:%F{#ef5b5b}%~%F{210}$ %f"

# Source additional configuration
## Shell Configuration
source $ZSH_SH_CONF/compinit.zsh
source $ZSH_SH_CONF/keybinds.zsh
## Helpful Additional things
source $ZSH_C/scripts/env_mgmt.sh
source $ZSH_C/aliases.sh
source $ZSH_C/nginx_shortcuts.sh
## Run setup scripts
source $ZSH_C/scripts/python_venv.sh
# FZF Fuzzy Search Setup
source $ZSH_C/fzf_bindings.zsh

