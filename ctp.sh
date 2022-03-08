#!/bin/bash
init(){
    inputText="Do you want to copy the file without extension?\n[yes - y] to accept, [no - n] to refuse and other keys to exit."
}

splitFile() {
    local file=$1
    if [ -f $file ]; then
        directory="$(dirname "$file")/"
        filename=$(basename -- "$file")
        extension="${filename##*.}"
        filename="${filename%.*}"
    else
        echo "$1 is not a file"
        exit 1
    fi
    
}

getInput(){
    echo -e $inputText
    read answer
}

checkInput(){
    if [[ $answer = "yes" || $answer = "y" ]]; then
        return 0
        elif [[ $answer = "no" || $answer = "n" ]]; then
        return 1
    else
        echo "Exitted"
        exit 130
    fi
}

copy(){
    if [ checkInput ];then
        sudo cp "${pwd}${directory}${filename}.${extension}" "/usr/local/bin/${filename}"
    else
        sudo cp "${pwd}${directory}${filename}.${extension}" "/usr/local/bin/${filename}.${extension}"
    fi
}
function main() {
    init
    if [ ! $1 ]; then
        echo "No arguments provided!"
        exit 1
    else
        splitFile $1
        getInput $inputText
        checkInput
        copy $1
    fi
}

main $1