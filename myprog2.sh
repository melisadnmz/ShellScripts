#!/bin/bash
dirName=cprogs
if [[ $# > 1 ]]; then
    echo "Invalid input"
elif [ ! -z $1 ]; then # program is run with an argument
    if [ ! -d "$1" ]; then # check given input directory or not a directory
        echo "Not a Directory"
        exit
    fi
    if [ -d "$dirName" ]; then #check cprogs directory already exist or not
        cd $1
        mkdir "$dirName"
        echo "A directory named cprogs is created under $1."
        mv $1/*.c ./$dirName/
        echo "All the files whose name ends with .c in $1 are
          moved into cprogs directory."
    else
        echo "Directory exists"
    fi
else #your program is run with no parameters
    if [ -d "$dirName" ]; then #check cprogs directory already exist or not
        mkdir "$dirName"
        echo "A directory named cprogs is created under current working directory."
        mv *.c ./$dirName
        echo "All the files whose name ends with .c in the current working
directory are moved into cprogs directory."
    else
        echo "Directory exists"
    fi
fi
