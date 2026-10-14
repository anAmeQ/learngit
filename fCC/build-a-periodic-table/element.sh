#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9] ]]
  then
  RESULT1=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE elements.atomic_number=$1;")
  else
  RESULT1=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE elements.symbol='$1' OR elements.name='$1';")
  fi
  if [[ -z $RESULT1 ]]
  then
    echo "I could not find that element in the database."
  else
    echo $RESULT1 | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
    do
      RESULT2=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM types JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")

      echo $RESULT2 | while IFS='|' read TYPE ATOMIC_MASS MPOINT BPOINT
      do
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPOINT celsius and a boiling point of $BPOINT celsius."
      done
    done  
  fi
else
  echo -e "Please provide an element as an argument."
fi
