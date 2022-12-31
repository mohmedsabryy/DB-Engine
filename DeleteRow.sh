#!/bin/bash





     echo  "Enter $(head -1 "$table_name" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) "
    read
    recordNum=$(cut -d ':' -f1 "$table_name" | awk '{if(NR != 1) print $0}'| grep -x -n -e "$REPLY" | cut -d':' -f1)
    if [[ "$REPLY" == '' ]]; then
        echo    "mno entry"
        echo "press Enter to continue"
        read
        
    elif [[ "$recordNum" = '' ]]; then
        echo  "mthis primary key doesn't exist"
        echo  "press Enter to continue"
        read
        
    else
        let recordNum=$recordNum+1 
        sed -i "${recordNum}d" "$table_name"
        echo  "record deleted successfully"
        echo  "press Enter to continue"
        read
        
    fi






# echo Tables :
# ls

# echo "enter name of the table"
# read tableName
# if ! [[ -f "$tableName" ]]; then
#     echo "this table doesn't exist"
#     echo " mpress Enter to continue"
#     read
    
# else
#     echo " Enter $(head -1 "$tableName" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) "
#     read
#     recordNum=$(cut -d ':' -f1 "$tableName" | awk '{if(NR != 1) print $0}'| grep -x -n "$REPLY" | cut -d':' -f1) "

#     if [[ "$REPLY" == '' ]]; then
        
#         echo " mpress Enter to continue
#         read;
        
#     elif [[ "$recordNum" == '' ]] ; then
#         echo "this primary key doesn't exist"
#         echo " mpress Enter to continue"
#         read
       
#     else
#         let recordNum=$recordNum+1 
#         sed -i "${recordNum}d" "$tableName"
#         echo "\e[42mrecord deleted successfully"
#         echo " mpress Enter to continue"
#         read
        
#     fi
# fi


   





# echo "DB:$currDB, table:$tableName" 

# # read column name from user
# read -p "Enter column name: " colName;


# # get column names from Metadata/$tableName
# colNames=($(awk -F: '{print $1}' Databases/$currDB/Metadata/$tableName.metadata))


# # validate column name
# colFlag=1  #false

# for i in "${!colNames[@]}"
# do 
#     if [[ $colName == "${colNames[$i]}" ]]; then
#         colFlag=0   #true
#         colNum=$(($i+1));  #column-Number
#     fi   
# done

# if [[ $colFlag == 0 ]]; then
#     # valid column-name

#     # read value to delete column with
#     read -p "Enter value to delete record with: " value;

#     # delete lines containing value in ith column
#     echo "colNum = $colNum"

#     # array of records to be deleted
#     # recordNum=($(awk -v varCol="$colNum" -v varValue="$value" -F: '{if ($varCol == varValue) {print FNR}}' "Databases/$currDB/Data/$tableName"))

#     counter=0

#     for i in "${!recordNum[@]}"
#     do
#         index=${recordNum[$i]}
#         index=$(($index-$counter))
#         echo "index:$index"
#         sed -i "$index"d Databases/$currDB/Data/$tableName

#         counter=$(($counter+1))
#     done
#     echo $recordNum
# else
#     echo "In-valid column name";
# fi
