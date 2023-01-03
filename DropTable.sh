#!/bin/bash

read -p "Enter table name you want to delete" table_name
 
    if [ -f $table_name ]; then
        rm $table_name
        echo  "deleted successfully "
        MainMenu.sh
    else
        echo "This table isn't exist "
        DropTable.sh
    fi



