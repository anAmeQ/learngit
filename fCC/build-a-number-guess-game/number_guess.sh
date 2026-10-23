#!/bin/bash
PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

# user enter their name
echo "Enter your username:"
read USERNAME

# check if user already exist in DB
USER_EXIST=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# if not exist
if [[ -z $USER_EXIST ]]; then
  # insert new user
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"
  # get user id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USER_ID=$(echo $USER_EXIST | xargs)

  # Fetch the stored username and trim whitespace
  DB_USERNAME=$($PSQL "SELECT username FROM users WHERE user_id=$USER_ID")
  DB_USERNAME=$(echo $DB_USERNAME | xargs)

  # count how many times user played game and trim white space
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM guesses WHERE user_id=$USER_ID")
  GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)

  # get minimum number of guesses
  BEST_GAME=$($PSQL "SELECT MIN(tries) FROM guesses WHERE user_id=$USER_ID")
  BEST_GAME=$(echo $BEST_GAME | xargs)

  # if user hasn't played game yet
  # set minimum guesses to 0
  if [[ -z $BEST_GAME ]]; then
    BEST_GAME=0
  fi

  echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# generate a random number from 1-1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
# initial number of guesses set to 0

echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
COUNT_GUESSES=1

while [[ ! $USER_GUESS == $SECRET_NUMBER ]]
    do  
        ((COUNT_GUESSES++))
        if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:"
        elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]; then
            echo "It's higher than that, guess again:"
        elif [[ $USER_GUESS -gt $SECRET_NUMBER ]];then
            echo "It's lower than that, guess again:"
        fi
        read USER_GUESS
    done
echo "You guessed it in $COUNT_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

INSERT_RESULT=$($PSQL "INSERT INTO guesses(random_number, tries, user_id) VALUES($SECRET_NUMBER, $COUNT_GUESSES, $USER_ID);")
