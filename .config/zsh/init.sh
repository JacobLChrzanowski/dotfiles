#

export PATH=$PATH:/home/jacobc/.local/bin
#export PATH="/opt/nvim-linux64/bin:$PATH"

HISTFILE=~/.history
HISTSIZE=25000
SAVEHIST=25000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
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
ZSH_C=~/.config/zsh
source $ZSH_C/aliases.sh
source $ZSH_C/keybinds.sh
source $ZSH_C/zsh_completion.sh
source $ZSH_C/nginx_shortcuts.sh

#run setup scripts
source $ZSH_C/scripts/python_venv.sh
# FZF Fuzzy Search Setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Python Virtual Environment
#echo Entering python virtual env
#source ~/.python_venv/bin/activate
#alias py3='ipython'

