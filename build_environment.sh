#!/bin/bash
set -e 
if [[ -z "$1" ]]
then
    echo "Usage: build_environment.sh environment_name"
    echo "Expects to find a workable python3 as 'python'"
    exit 1
elif [[ -e "$1" ]]
then
    read -p "$1 exists, delete it? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm -rf "$1"
    else
        echo "Not creating env"
        exit 1
    fi
fi

python -m venv "$1"
. "$1"/bin/activate
pip install --upgrade pip
# once PR merged and pip uploaded can replace git below with just Chiplotle3
pip install git+https://github.com/str4w/chiplotle3.git vpype vpype-ttf 
