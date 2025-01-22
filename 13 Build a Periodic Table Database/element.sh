PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN_MENU() {
  SEARCHING_ELEMENT=$1
  # If it's empty
  if [[ -z $SEARCHING_ELEMENT ]]
  then
    echo "Please provide an element as an argument."
    exit
  fi
  # If is a number
  if [[ $SEARCHING_ELEMENT =~ ^[0-9]+$ ]]
  then
      CONDITION='p.atomic_number'
      QUERY $SEARCHING_ELEMENT $CONDITION
      exit
  fi
  # If is a symbol
  NUMBER_OF_CHARACTERS=$(printf $SEARCHING_ELEMENT | wc -m )
  if [[ $NUMBER_OF_CHARACTERS == 1 || $NUMBER_OF_CHARACTERS == 2 ]]
  then
      CONDITION='e.symbol'
      QUERY $SEARCHING_ELEMENT $CONDITION
      exit
  #If is a name
  else
    CONDITION='e.name'
    QUERY $SEARCHING_ELEMENT $CONDITION
    exit
  fi
} 

QUERY() {
      SEARCHING_ELEMENT=$1
      CONDITION=$2
      ELEMENT=$($PSQL "SELECT e.atomic_number, e.symbol, e.name, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type FROM elements AS e INNER JOIN properties AS p USING(atomic_number) INNER JOIN types AS t USING(type_id) WHERE $CONDITION = '$SEARCHING_ELEMENT'")
      if [[ -z $ELEMENT ]]
      then
        echo "I could not find that element in the database."
        exit
      fi
      echo "$ELEMENT" | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
      do
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      done
}

MAIN_MENU $1