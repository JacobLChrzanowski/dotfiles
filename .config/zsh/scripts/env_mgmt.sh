#!/bin/bash
function print_term_envs() {
    if [[ -n $SSH_CLIENT || -n $SSH_CONNECTION || -n $SSH_TTY ]]; then
        echo "SSH_CLIENT    : $SSH_CLIENT"
	echo "SSH_CONNECTION: $SSH_CONNECTION"
	echo "SSH_TTY       : $SSH_TTY"
    fi
}

check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

