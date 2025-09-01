#
export ZSH_C=`dirname "${(%):-%N}"`
# What is this for?
path+=("/home/$USER/.local/bin")
# Provides path for zellij
path+=("/home/$USER/.cargo/bin/")
#export PATH="/opt/nvim-linux64/bin:$PATH"
# Provides path for ruby gems
path+=("/home/$USER/bin")
path+=("${ZSH_C}/scripts")

HISTFILE=~/.history
HISTSIZE=25000
SAVEHIST=25000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE
export WORDCHARS='*?_.[]~&;!#$%^(){}<>'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export GCM_CREDENTIAL_STORE=gpg

autoload -Uz promptinit
promptinit
#prompt adam1
setopt histignorealldups sharehistory

#EDITOR=/opt/nvim-linux64/bin/nvim
EDITOR=/usr/local/bin/nvim

PROMPT='%B%F{37}%n%b%F{154}@%F{214}%m%f:%~$ '
source $ZSH_C/zsh_completion.sh # contains compinit 
source $ZSH_C/scripts/env_mgmt.sh
source $ZSH_C/aliases.sh
source $ZSH_C/keybinds.sh
source $ZSH_C/nginx_shortcuts.sh

#run setup scripts
source $ZSH_C/scripts/python_venv.sh
# FZF Fuzzy Search Setup
source $ZSH_C/fzf_bindings.zsh

#print_term_envs
# Python Virtual Environment
#echo Entering python virtual env
#source ~/.python_venv/bin/activate
#alias py3='ipython'

