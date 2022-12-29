#!/usr/bin/bash

connect_DB()
{
    cd ~/DataBase/$name_DB
    echo -e "Welcome To $name_DB Database \n"
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Use Table" "update Table From Table" "Delete record" "Delete column" "Back Main Menu"
    do
    case $table in 
    "Create Table" )

    CreateTable.sh 
    ;;
    "List Tables" ) 
    ShowTables.sh
    ;;
    "Drop Table" )
    DropTable.sh
    ;;
    "Insert To Table" )
    InsertTable.sh 
    ;;
    "Use Table" )
    UseTable.sh 
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
            MainMenu.sh
        else
         connect_DB
        fi
    else
        echo -e "Database Server is Empty \n"
        echo -e "Switching you To The Main Menu"
        MainMenu.sh
    fi
fi





