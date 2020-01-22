while :; do
    clear
    #!/bin/bash
    echo "Please select an option"
    echo "1. Check for palindromes"
    echo "2. Move .c files"
    echo "3. Draw hollowed square"
    echo "4. Uppercase conversion"
    echo "5. Delete files"
    echo "6. Exit"
    read opt
    if [[ $opt == 1 ]]; then
        echo "Please enter an input for checking :"
        read input
        ./myprog1.sh $input
        read -p "Press enter to continue..."
    elif [[ $opt == 2 ]]; then
        echo "Please enter an optinal pathname :"
        read path
        ./myprog2.sh $path
        read -p "Press enter to continue..."
    elif [[ $opt == 3 ]]; then
        echo "Please enter two number for hollowed square :"
        printf "Number 1:"
        read num1
        printf "Number 2:"
        read num2
        ./myprog3.sh $num1 $num2
        read -p "Press enter to continue..."
    elif [[ $opt == 4 ]]; then
        echo "Please enter a wildcard and an optional pathname :"
        printf "Enter wildcard: "
        read wildcard
        printf "Enter pathname (optional): "
        read pathname
        ./myprog4.sh $wildcard $pathname
        read -p "Press enter to continue..."
    elif [[ $opt == 5 ]]; then
        printf "Please enter an optinal pathname and an optinal -R option :"
        read pathname read option
        ./myprog5.sh $pathname $option
        read
    elif [[ $opt == 6 ]]; then
        clear
        break
    else
        echo "Invalid input!!!"
        read
    fi
done
