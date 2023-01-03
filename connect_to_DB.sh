#!/usr/bin/bash

connect_DB()
{
    cd ~/DataBase/$name_DB
    echo "Welcome To $name_DB Database "
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Use Table" "Update Table" "Back Main Menu"
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
    InsertIntoTable.sh 
    ;;
    "Use Table" )
    UseTable.sh 
    ;;
    "Update Table" )
    UpdateTable.sh
    ;;
    "Back Main Menu" )
      pwd
     MainMenu.sh

    ;;
    * )
            echo "Invalid option $REPLY"
            echo "Please Choose From The Upper Menu "
    ;;
        esac
    done
}



read -p "Enter database name: " name_DB
 
if [ -d $name_DB ] 
    then
    connect_DB
else
    echo  "This Database Isn't Exist or DB server is empty "
     echo  "Switching You To The Main Menu "
            sleep 3
            MainMenu.sh
fi




