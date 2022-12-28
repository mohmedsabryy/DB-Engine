#!/usr/bin/bash 


read -p "Enter Database Name: " name
            if [ -e $name ] ;then
                echo "Database Already Exits : "
                
            elif [[ "$name" =~ ^([a-zA-Z])+([a-zA-Z0-9\_])*$ ]]; then 
            mkdir ~/DataBase/$name
                echo "$name Created Successfully"
            else 
                 echo "Database name can't start with numbers or contain special characters"
            fi
