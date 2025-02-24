# Configures FZF bindings and sources spare file if unavailable in the system
# Control vars:
#  - FZF_VERBOSE: if 'true', prints to shell whether it is using fallback files
if [[ ! $(which fzf) ]]; then
    echo "fzf not present"
    return 1
fi
fzf_share='/usr/share/fzf'
fzf_fallback_share="$HOME/.config/zsh/scripts/fzf"
completion='completion.zsh'
key_bindings='key-bindings.zsh'

p_completion="${fzf_share}/$completion"
p_key_bindings="${fzf_share}/$key_bindings"

f_completion="${fzf_fallback_share}/${completion}"
f_key_bindings="${fzf_fallback_share}/${key_bindings}"

if [ -f "$p_completion" ]; then
    source $p_completion;
else
    if [[ "$FZF_VERBOSE" == "true" ]]; then
        echo "FZF Completion file is missing: '$completion' using included fallback instead.";
    fi
    source $f_completion
fi;

if [ -f "$p_key_bindings" ]; then
    source $p_key_bindings
else
    if [[ "$FZF_VERBOSE" == "true" ]]; then
        echo "FZF Key Bindings file is missing: '${key_bindings}' using included fallback instead.";
    fi
    source $f_key_bindings
fi;

