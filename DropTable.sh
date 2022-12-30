#!/bin/bash






echo "Enter table name you want to delet "
read table_name



    if [ -f $table_name ]; then
        rm $table_name
        echo -e "deleted successfully \n"
        MainMenu.sh
    else
        echo -e "This table isn't exist \n"
        MainMenu.sh
    fi



