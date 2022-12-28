#!/usr/bin/bash

connect_DB()
{
    cd ~/DataBase/$name_DB
    echo -e "Welcome To $name_DB Database \n"
    select table in "Create Table" "List Tables" "Drop Table" "Insert To Table" "Select From Table" "Delete From Table" "Back Main Menu"
    do
    case $table in 
    "Create Table" )
<<<<<<< HEAD
    createTable.sh 
=======
    CreateTable.sh 
>>>>>>> 3d2392fda8bad27bf9ad08699a1220cfe45feccd
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
<<<<<<< HEAD
    "update Table From Table" )
    updateTable.sh
    ;;
    "Back Main Menu" )
     MainMenu.sh
=======
    "Delete From Table" )
    deleteTable.sh
    ;;
    "Back Main Menu" )
    MainMenu.sh
>>>>>>> 3d2392fda8bad27bf9ad08699a1220cfe45feccd
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





