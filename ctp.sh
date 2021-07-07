#!/bin/bash

if [ $1 ]; then
    mightBeFile=$1
    if [ -f $mightBeFile ]; then
        sudo cp $mightBeFile /usr/local/bin/
    else
        echo "$mightBeFile is not a file."
    fi
fi