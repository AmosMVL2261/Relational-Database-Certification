#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Ask the username
echo "Enter your username:"
read CURRENT_USER
# Create the random number to be guess
RANDOM_NUMBER=$(( RANDOM % 1001 ))
echo $RANDOM_NUMBER
USER_DB=$($PSQL "SELECT username, games_played, best_game_tries FROM users WHERE username='$CURRENT_USER'")
# If the user was not found in the database, add user to database
if [[ -z $USER_DB ]]
then
  echo "Welcome, $CURRENT_USER! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$CURRENT_USER')")
# If the user was found, show user data
else
  echo $USER_DB | while IFS='|' read USERNAME GAMES_PLAYED BEST_GAME_TRIES
  do
    USER_DATA=$($PSQL "SELECT ")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME_TRIES guesses."
  done
fi
CURRENT_TRIES=0
# This flag will break the while 
FLAG=0
# First time only
echo "Guess the secret number between 1 and 1000:"
# Only works until user guess the number
while [[ $FLAG == 0 ]]
do
  
  read INPUT_NUMBER
  #Increase the user tries count
  CURRENT_TRIES=$(( $CURRENT_TRIES + 1 ))
  # Check if the input is a number
  if [[ $INPUT_NUMBER =~ ^[0-9]+$ ]]
  then
    # The user guessed the number
    if (( $INPUT_NUMBER == $RANDOM_NUMBER ))
    then
      #echo "You guessed it in $CURRENT_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      FLAG=1
    # If the input is higher than the random number
    elif (( $INPUT_NUMBER < $RANDOM_NUMBER ))
    then
      echo "It's higher than that, guess again:"
    # If the input is less than the random number
    elif (( $INPUT_NUMBER > $RANDOM_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    fi
  # The input is not a number
  else
    echo "That is not an integer, guess again:"
  fi
done
# Get user user data to compare
USER_DB=$($PSQL "SELECT username, games_played, best_game_tries FROM users WHERE username='$CURRENT_USER'")
# Leer los valores desde la salida
IFS="|" read -r USERNAME GAMES_PLAYED BEST_GAME_TRIES <<< "$USER_DB"
# Actualizar los intentos si es necesario
if [ -z "$BEST_GAME_TRIES" ] || [ "$CURRENT_TRIES" -lt "$BEST_GAME_TRIES" ]; then
  BEST_GAME_TRIES=$CURRENT_TRIES
fi
# Incrementar los juegos jugados
GAMES_PLAYED=$((GAMES_PLAYED + 1))
# Actualizar los datos del usuario en la base de datos
UPDATE_DATA=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game_tries=$BEST_GAME_TRIES WHERE username='$CURRENT_USER'")
# Mensaje final
printf "You guessed it in $CURRENT_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"