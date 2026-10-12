#!/bin/bash
PSQL="psql  -A -t --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    else
        echo -e "\nWelcome to My Salon, how can I help you?\n"
    fi

    SERVICES=$($PSQL "SELECT service_id || ') ' || name  FROM services;")  
    echo $SERVICES

    read SERVICE_ID_SELECTED
    case $SERVICE_ID_SELECTED in
        1) SERVICE_NAME="cut" 
        MAKE_APPOINTMENT;;
        2) SERVICE_NAME="color" 
        MAKE_APPOINTMENT;;
        3) SERVICE_NAME="style" 
        MAKE_APPOINTMENT;;
        4) SERVICE_NAME="perm" 
        MAKE_APPOINTMENT;;
        5) SERVICE_NAME="trim" 
        MAKE_APPOINTMENT;;
        *) MAIN_MENU "I could not find that service. What would you like today?" ;;
    esac
}
MAKE_APPOINTMENT() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_NAME ]]
    then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
    fi
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
