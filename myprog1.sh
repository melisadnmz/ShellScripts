#!/bin/bash
len=$(echo $@ | wc -c)
len=$(expr $len - 1)
i=1
j=$(expr $len / 2)
while test $i -le $j; do
    k=$(echo $@ | cut -c $i)
    l=$(echo $@ | cut -c $len)
    if [[ "${k,,}" != "${l,,}" ]]; then # check letter by one by
        echo $@ it is not a palindrome # if one letter of word not match of reversed word letter
        exit
    fi
    i=$(expr $i + 1)
    len=$(expr $len - 1)
done
echo $@ is a palindrome # All letter checked and word is a palindrome
