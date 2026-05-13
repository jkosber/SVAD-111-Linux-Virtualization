#!/bin/bash

min_number=1
max_number=10

my_number=$(( $RANDOM % $max_number + $min_number ))

echo -n "Guess a number between ${min_number} and ${max_number}: "
read number_guess

if [ ! -z "${number_guess##*[!0-9]*}" ]; then

    echo "My number is ${my_number}. You guessed ${number_guess}."


    if [ "${number_guess}" -eq "${my_number}" ]; then
        echo "Congratulations! You guessed correctly!"
    else
        echo "Sorry, better luck next time!"
    fi

else

    echo "Error: '${number_guess}' is not a valid integer. Please enter a number."
fi

exit 0
