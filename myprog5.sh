#!/bin/bash
deleteFile() {
        for i in $(ls); do
        if [ ! -s $i ]; then
            printf "Do you want to delete $i? (y/n): "
            read opt
            if [[ $opt == "y" ]]; then
                echo "1 file deleted"
                rm -f $i
            fi
        fi
    done
}

recursive() {
    for directory in $(ls); do
        [ -d "$directory" ] || continue
        cd $directory
        deleteFile
        cd ..
    done
}

if [[ $# == 2 ]]; then #if users enter -R and pathname
    cd $1
    recursive
    deleteFile
elif [[ $1 == "-R" ]]; then #if users enter just -R
    recursive
    deleteFile
elif [[ $1 == "" ]]; then #if users enter nothing
    deleteFile
elif [[ ! -z $1 ]]; then # if users enter just pathname
    if [ -d "$1" ]; then
        cd $1
        deleteFile
    else
        echo "Directory do not exist."
    fi
fi
