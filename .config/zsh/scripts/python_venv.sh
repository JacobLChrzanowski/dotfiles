#!/bin/bash

#Python Virtual Environment setup
venv_path="$HOME/.python_venv"

# Check and create if missing
if [ -d "$venv_path" ]; then
else
    python3 -m venv "$venv_path"
    echo "Python virtual environment created successfully in $venv_path"
fi
echo "Entering python virtual env in $venv_path"
source $venv_path/bin/activate
alias py3='ipython'

