# Configures FZF bindings and sources spare file if unavailable in the ssytem

fzf_share='/usr/share/fzf'
completion="${fzf_share}/completion.zsh"
key_bindings="${fzf_share}/key-bindings.zsh"

if [ -f $completion ]; then
    source $completion;
else
    echo "FZF Completion file is missing: $completion";
fi;

if [ -f $key_bindings ]; then
    source $key_bindings
else
    echo "FZF Key Bindings file is missing?: '${key_binding}'";
fi;

