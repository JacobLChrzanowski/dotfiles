#!/bin/bash
python=":"
if [[ $(which python3) ]]; then
    python=$(which python3);
elif [[ $(which python) ]]; then
    python=$(which python);
else
    echo 'Python is not installed';
    exit 1
fi
#Python Virtual Environment setup
venv_path="$HOME/.python_venv"

# Check and create if missing
if [ -f "$venv_path/bin/activate" ]; then
else
    $python -m venv "$venv_path"
    if [[ $? -eq 0 ]]; then
        echo "Python virtual environment created successfully in $venv_path";
    else
        echo "Python virtual environment could not be created in $venv_path";
        exit 1;
    fi
fi
echo "Entering python virtual env in $venv_path"
source $venv_path/bin/activate
alias py3='ipython'

