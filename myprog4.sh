if [ $# -eq 1 ]; then #program is run only with the wildcard
    for fileName in *.txt; do	# Takes every files in working current directory
        if [[ $fileName == *.txt ]]; then	# Checks whether it's a txt file
            while read -a words; do		# Reads the words in taken txt file
                for word in "${!words[@]}"; do
                    string=${words[word]}
                    input=$1
                    var=${input//'?'/*}		#Checks whether wildcard is same with taken word
                    if [[ $string == $1 ]]; then
                        echo "The word \"$string\" inside $fileName is substituted with  \"${string^^}\"."
                        sed -i "s/$string/\U&/g" $fileName
                    fi
                done
            done <$fileName
        fi
    done
elif [ $# -eq 2 ]; then #program is run with two arguments, one wildcard other path name
    if [ ! -d "$1" ]; then # check given input directory or not a directory
        echo "Not a Directory"
        exit
    fi
    cd $2	# Goes to given directory
    for fileName in $(ls); do	# Takes every files given directory
        if [[ $fileName == *.txt ]]; then
            while read -a words; do
                for word in ${!words[@]}; do
                    string=${words[word]}
                    input=$1
                    var=${input//'?'/*}
                    if [[ $string == $1 ]]; then
                        echo "The word \"$string\" inside $2/$fileName is substituted with  \"${string^^}\"."
                        sed -i "s/$string/\U&/g" $fileName
                    fi
                done
            done <$fileName
        fi
    done
elif [ $# -eq 0 ]; then
    echo "Invalid Input!"
    exit
fi
