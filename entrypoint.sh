#!/bin/bash
# ref) https://github.com/JackMcKew/pyinstaller-action-windows/blob/main/entrypoint.sh

# Fail on errors.
set -e

# Make sure .bashrc is sourced
# . /root/.bashrc

fletpack()
{
    if [ -n "$2" ]; then
        ADD_DATA=""
        ARGS=(${2//@/ })
        for AD in "${ARGS[@]}"; do
            ADD_DATA="${ADD_DATA} --add-data ${AD}"
        done
        echo "wine flet pack $1 ${ADD_DATA}"
    else 
        echo "wine flet pack $1 "
    fi
}

# Allow the workdir to be set using an env var.
# Useful for CI pipiles which use docker for their build steps
# and don't allow that much flexibility to mount volumes
SRCFILE=$1
ADDDATA=$2

if [ -f "requirements.txt" ]; then
    echo "LOAD: requirements.txt"
    echo "wine pip install -r requirements.txt"
    fletpack $SRCFILE $ADDDATA
else
    fletpack $SRCFILE $ADDDATA
fi


