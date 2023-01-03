#!/usr/bin/bash 


read -p "Enter Database Name: " name
     if [ -d ~/DataBase/"$name" ] ; then 
         rm -r ~/DataBase/"$name"
         echo "$name Deleted Successfully"
         sleep 3
        MainMenu.sh
     else 
         echo "Error Not Exist Database"
        DropDatabase.sh
     fi
