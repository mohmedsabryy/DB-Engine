#!/usr/bin/bash 
if [[ ! "$(ls -A $PWD)"  ]]; then
    echo "No Tables"
else
    
    echo Available Tables :
    ls
fi
