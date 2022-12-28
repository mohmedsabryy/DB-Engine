#!/bin/bash

connect_DB()
{
    cd ~/DB_Engine/$name_DB
    echo -e "Welcome To $name_DB Database \n"
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Select From Table" "Delete From Table" "Back Main Menu"
    do
    case $table in 
    "Create Table" )
    createTable.sh 
    ;;
    "List Tables" ) 
    showTables.sh
    ;;
    "Drop Table" )
    DropTable.sh
    ;;
    "Insert To Table" )
    InsertTable.sh 
    ;;
    "Select From Table" )
    SelectTable.sh 
    ;;
    "update Table From Table" )
    updateTable.sh
    ;;
    "Back Main Menu" )
     MainMenu.sh
    ;;
    * )
            echo "Invalid option $REPLY"
            echo -e "Please Choose From The Upper Menu \n"
    ;;
        esac
    done
}



echo "Enter database name: "
read name_DB;

# check if database exists
if [ -d ~/DataBase ] 
then
    cd ~/DataBase
    arr=($(ls))
    list=`ls -d * `
    if [ ${#arr[@]} -gt 0 ]
    then
    echo -e "Databases in This Server : \n"
        for i in $list 
        do 
            echo $i 
        done
        if [ ! -d $name_DB ]
        then
            echo -e "This Database Isn't Exist \n"
            echo -e "Switching You To The Main Menu \n"
            ~/ITI9Month/linux/Bash/DB-Engine/MainMenu.sh
        else
         connect_DB
        fi
    else
        echo -e "Database Server is Empty \n"
        echo -e "Switching you To The Main Menu"
        . ~/ITI9Month/linux/Bash/DB-Engine/MainMenu.sh
    fi
fi





