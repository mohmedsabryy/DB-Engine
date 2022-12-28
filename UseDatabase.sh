#!/usr/bin/bash 


read -p "Enter Database Name: " name
	if [ -d ~/DataBase/$name ] ; then 
             cd ~/DataBase/$name
             pwd
             echo "I connect DB $name: "
             cd
        else 
             echo "Error Not Exist Database"
        fi
