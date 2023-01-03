#!/usr/bin/bash 

if [[ ! "$(ls ~/DataBase)"  ]]; then
    echo "No Databases available!"
    
else
    echo Available Databases :
    ls 
    sleep 3
    MainMenu.sh
     
fi

