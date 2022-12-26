#!/usr/bin/bash 

if [[ ! "$(ls -A ~/DataBase)"  ]]; then
    echo "No Databases available!"
    
else
    echo Available Databases :
    ls
    
    
fi

