#!/bin/bash

echo "Enter table name you want to delet "
read table_name

table_DB=($(ls))
if [ ${#table_DB[@]} -gt 0 ] then
    echo -e "All tables in your databese \n"
    for i in $(ls *)
    do
        echo $i
    done
    if [ -f $table_name ] then
        rm $table_name
        echo -e "deleted successfully \n"
    else
        echo -e "This table isn't exist \n"
        MainMenu.sh
    fi
else 
    echo -e "This database is already empty"
    MainMenu.sh
fi









# tables_DB=($(ls))
# if [ ${#tables_DB[@]} -gt 0 ]
# then
#     echo -e "All Tables in this database : \n"
#     for i in $(ls *)
#     do
#          echo $i
#     done
#     echo -e "Enter the table you want to delete \n"
#     read table_name
#     if [ -f $table_name ]
#     then 
#          rm $table_name
#          echo -e "Table is deleted successfully \n"
#      else
#          echo -e "This table isn't exist \n "
#          . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
#     fi
# else
#     echo -e "This database is already empty"
#     . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
# fi




# echo "Enter Table Name"
# read TableName 
# if [ -f  "Databases/$currDB/Data/$TableName" ] && [ -f  "Databases/$currDB/Metadata/$TableName.metadata" ]; then 
#     rm -r Databases/$currDB/Data/$TableName
#     rm -r Databases/$currDB/Metadata/$TableName.metadata
#     echo "$TableName Table  deleted Successfully"
#   else 
#     echo "No such Table"
# fi

