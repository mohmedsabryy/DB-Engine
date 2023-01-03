#!/usr/bin/bash 
if [[ ! "$(ls -f $PWD)"  ]]; then
    echo "No Tables"
else
    
    echo Available Tables :
    ls
    
fi
