# Zsh Keybinds
# Useful when PuTTY and VSCode do not agree on key codes
# PuTTY should have following settings:
# Terminal > Keyboard > Shft/Ctrl/Alt with the Arrow Keys > xterm-style bitmap
# Terminal > Features > [X] Disable application cursor keys mode

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

if [ -z ${TERM_PROGRAM} ]; then
    echo No TERM_PROGRAM var set
    bindkey "^[[D" backward-char
    bindkey "^[[1;5D" backward-word
    bindkey "^[[C" forward-char
    bindkey "^[[1;5C" forward-word
    #
    bindkey "^?" backward-delete-char
    bindkey "^H" backward-kill-word
    bindkey "^[[3~" delete-char
    bindkey "^[[3;5~" delete-word
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[4~" end-of-line
    ;
elif [ ${TERM_PROGRAM} = 'WezTerm' ]; then
    echo Using WezTerm
    bindkey "^[[D" backward-char
    bindkey "^[[1;5D" backward-word
    bindkey "^[[C" forward-char
    bindkey "^[[1;5C" forward-word
    #
    bindkey "^?" backward-delete-char
    bindkey "^H" backward-kill-word
    bindkey "^[[3~" delete-char
    bindkey "^?" backward-delete-char
    bindkey "^H" backward-kill-word
    bindkey "^[[H" beginning-of-line
    bindkey "^[[F" end-of-line
    ;
else
    echo Using VSCode
    bindkey "^[[D" backward-char
    bindkey "^[[C" forward-char
    bindkey "^[[1;5D" backward-word
    bindkey "^[[1;5C" forward-word
    bindkey "^[[3~" delete-char
    bindkey "^H" backward-kill-word
    bindkey "^?" backward-delete-char
    bindkey "^[[1~" beginning-of-line
    bindkey "^[[4~" end-of-line
    ;
fi;

