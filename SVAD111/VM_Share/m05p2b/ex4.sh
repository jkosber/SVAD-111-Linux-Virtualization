#!/bin/bash

min_arg=$1
max_arg=$2

if [ -z "$min_arg" ] || [ -z "$max_arg" ]; then
    echo "Incorrect input detected!!"
    echo "Please provide a minimum and maximum number"
    echo "Example: 1 10"
    exit 1
fi

if [[ ! "$min_arg" =~ ^[0-9]+$ ]] || [[ ! "$max_arg" =~ ^[0-9]+$ ]]; then
    echo "Both arguments must be integers."
    exit 1
fi

if [ "$max_arg" -le "$min_arg" ]; then
    echo "The second number ($max_arg) must be greater than the first ($min_arg)."
    exit 1
fi

min_number=$min_arg
max_number=$max_arg

range=$(( max_number - min_number + 1 ))
my_number=$(( RANDOM % range + min_number ))

echo -n "Guess a number between ${min_number} and ${max_number}: "
read number_guess

if [ ! -z "${number_guess##*[!0-9]*}" ] && [ ! -z "$number_guess" ]; then
    echo "My number is ${my_number}. You guessed ${number_guess}."
    if [ "${number_guess}" -eq "${my_number}" ]; then
        echo "Congratulations! You guessed correctly!"
    else
        echo "Sorry, better luck next time!"
    fi
else
    echo "Your guess must be a valid integer."
fi

exit 0
