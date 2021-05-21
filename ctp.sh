#!/bin/bash

if [ $1 ]; then
    argument=$1
    newfile="ctp_$argument"

    if [ -f $argument ]; then
        echo "a"
        sudo cp $argument $newfile
        sudo mv $newfile /usr/local/bin/$argument
    else
        echo "$argument is not a file."
    fi
fi
