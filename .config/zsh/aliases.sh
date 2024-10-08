# Aliases and aliased commands

alias editz='vim ~/.zshrc'
alias loadz='source ~/.zshrc'
alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias oldvim="command vim"
alias vim='nvim'
#alias python3='python3.10'
#alias pip3='pip3.10'

# git setup for maintaining dotfiles
# https://www.atlassian.com/git/tutorials/dotfiles
config() { git --git-dir=$HOME/.cfg/ --work-tree=$HOME "$@" }
configls() { config ls-files --exclude-standard --others --directory "$@" }

# Leave at the bottom
# https://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

