#!/usr/bin/bash 


read -p "Enter Database Name: " name
            if [ -d $name ] ;then
                echo "Database Already Exits : "
                
            elif [[ "$name" =~ ^([a-zA-Z])+([a-zA-Z0-9])*$ ]]; then 
            mkdir ~/DataBase/$name
                echo "$name Created Successfully"
                sleep 3
                MainMenu.sh
            else 
                 echo "Database name can't start with numbers or contain special characters"
                 CreateDatabase.sh
            fi
