#!/bin/bash
# ref) https://github.com/JackMcKew/pyinstaller-action-windows/blob/main/entrypoint.sh

# Fail on errors.
set -e

# Make sure .bashrc is sourced
. /root/.bashrc

# Allow the workdir to be set using an env var.
# Useful for CI pipiles which use docker for their build steps
# and don't allow that much flexibility to mount volumes
SRCDIR=$1

ls .
echo $PWD

wine python -m pip install --upgrade pip wheel setuptools

if [ -f "pyproject.toml" ]; then
    echo "LOAD: pyproject.toml"
    wine poetry install 
    wine flet pack $SRCDIR
elif [ -f "requirements.txt" ]; then
    echo "LOAD: requirements.txt"
    wine python pip install -r ./requirements.txt
    wine flet pack $SRCDIR
else
    wine flet pack $SRCDIR
fi


