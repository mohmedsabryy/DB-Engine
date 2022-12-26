#!/usr/bin/bash 


read -p "Enter Database Name: " name
            if [ -e $name ] ;then
                echo "Database Already Exits : "
            else 
                mkdir ~/DataBase/$name
                echo "$name Created Successfully"
            fi
