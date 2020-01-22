#!/bin/bash
if ! [[ "$1" =~ ^[0-9]+$ ]]
    then
        echo "Invalid input!!!"
	exit
fi
if ! [[ "$2" =~ ^[0-9]+$ ]]
    then
        echo "Invalid input!!!"
	exit
fi
differ=$(($1 - $2)) #take differences of inputs
big=$(($differ / 2))
sum=$(($1 + $2))
small=$(($sum / 2 - 1))
if [ $differ -gt 0 ]; then #check input 1 grater than input 2
    mod=$(($differ % 2)) #check difference between two numbers are even
    if [ $mod -eq 0 ]; then
        for ((i = 0; i < $1; i++)); do #print * for the rules in the if statements
            for ((j = 0; j < $1; j++)); do
                if [[ $i -lt $big ]] || [[ $i -gt $small ]] || [[ $j -lt $big ]] || [[ $j -gt $small ]]; then
                    echo -n "*"
                else
                    echo -n " "
                fi
            done
            echo "" #### print the new line ###
        done
    else
        echo "The difference between the two arguments must be an even number."
    fi
else
    echo "The first argument must be greater than the second one."
fi
