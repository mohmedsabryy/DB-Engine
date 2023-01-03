#!/usr/bin/bash 


read -p "Enter Database Name: " name
     if [ -d ~/DataBase/"$name" ] ; then 
         rm -r ~/DataBase/"$name"
         echo "$name Deleted Successfully"
     else 
         echo "Error Not Exist Database"
     fi
