#!/usr/bin/bash 

if [ -d ~/DataBase ] ; then 
    cd ~/DataBase
else 
    mkdir ~/DataBase
    echo "DataBase Folder Created!"
    cd ~/DataBase
fi

select choice in CreateDB ShowDBs UseDB DropDB Exit
do 
    case $choice in 
        CreateDB )
        	CreateDatabase.sh
        ;; 
        ShowDBs ) 
        	ShowDatabase.sh
        ;;
       
        UseDB )
        	UseDatabase.sh
        ;;
         DropDB )
        	DropDatabase.sh
        ;;
        Exit )
            break
        ;;
        *) 
         echo "default"
    esac
done
