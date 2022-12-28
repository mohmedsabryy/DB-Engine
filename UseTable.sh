#!/bin/bash
# Use_Table(){
# options=("displayTable" "Select By PK" "Return To Main Menu");
# while [[ "$option" != "Return To Main Menu" ]]
# do
# select option in "${options[@]}" 
# do 
#        case $option in 
#        "displayTable") . ./displayTable.sh; break ;;
#        "Select By PK") . ./SelectPK.sh; break;;
#        "Return To Main Menu") . ./mainMenu.sh; exit $? ;;
#         *) echo "Invalid option $REPLY";;

#          esac
#     done
#     done
# }

# Use_Table;







Use_Table(){
    echo -e "Enter table name \n"
    read table_name ;
    if [ -f $table_name ] then 
        # Metadata.sh
        read primary_key <<< $(sed '2!d' $table_name) ;
        read -a columns <<< $(sed '4!d' $table_name) ;
        read -a datatype <<< $(sed '6!d' $table_name) ;
        echo -e "Columns of the table : \n ${columns[@]} \n"
        echo -e "The Column index which have the primary key constraint : \n $primary_key \n"
        echo -e "The data type for each column ( integer , string )\n"
        echo ${datatype[@]} ;

        option=("display table" "Select record by PK" "Back to cennect menu");
        while [[ "$option" != "Back to cennect menu" ]]
        do
            select option in "${option[@]}"
               do
                   case $option in 
                        "display table" ) 
                            if  [[ $(sed '1,7d' $table_name | wc -l) -eq 0 ]]
                            then 
                                echo -e "There are no records in the table "
                            else
                                echo -e "Displaying all the records :\n"
                                sed '1,7d' $table_name
                            fi
                            ;;
                        "Select record by PK" )
                            echo -e "Enter a primary key value you want display"
                            read primary_PK
                            typeset -i pk_fiel=$primary_key+1
                            if [[ $(sed '1,7d' $table_name | cut -d " " -f $pk_fiel | grep -x $primary_PK | sed '1!d') ==  $primary_PK ]]
                            then
                                let selected_record=$(cut -d " " -f $pk_fiel $table_name | grep -n -x $primary_PK | cut -d: -f1)
                                echo -e "\n\nThe Record : \n"
                                sed -n "${selected_record}p" "$table_name"
                            else
                                echo -e "The primary key value doesn't match any \n"
                            fi



                            ;;
                        "Back to cennect menu" )
                        Connect_To_DB.sh;;
                        * )
                        echo -e "Please , Choose From the above list \n";
                    esac
            done
    
        done
    else
        echo -e "Table isn't exist\n"
    fi
  
}
Use_Table ;

# select_record(){
#     echo -e "Enter Table name \n"
#     read table_name
#     if [ -f $table_name ]
#     then
#         #   Metadata.sh
#             read primary <<< $(sed '2!d' $table_name)
#             read -a cols <<< $(sed '4!d' $table_name )
#             read -a datatype <<< $(sed '6!d' $table_name )
#             echo -e "Columns of the table : \n ${cols[@]} \n"
#             echo -e "The data type for each column ( int  -> integer ),( string -> string datatype )\n"
#             echo ${datatype[@]}
#             echo -e "The Column index which have the primary key constraint : \n $primary \n"
#             echo -e "\n"
#         select choice in "Select All Records" "Select Record By Primary Key" "Back To Connect To Database Menu"
#         do
#             case $choice in 
#             "Select All Records" )
#                 if  [[ $(sed '1,7d' $table_name | wc -l) -eq 0 ]]
#                 then 
#                     echo -e "There are no records in the table "
#                 else
#                     echo -e "Displaying all the records :\n"
#                     sed '1,7d' $table_name
#                 fi
#                 ;;
#             "Select Record By Primary Key" )
#                 echo -e "Entering the Primarykey value of the record you wanna display \n"
#                 read primary_key
#                 typeset -i pk_field=$primary+1
#                 if [[ $(sed '1,7d' $table_name | cut -d " " -f $pk_field | grep -x $primary_key | sed '1!d') ==  $primary_key ]]
#                 then
#                     let selected_record=$(cut -d " " -f $pk_field $table_name | grep -n -x $primary_key | cut -d: -f1)
#                     echo -e "\n\nThe Record : \n"
#                     sed -n "${selected_record}p" "$table_name"
#                 else
#                     echo -e "The primary key value doesn't match any \n"
#                 fi
#                 ;;
#             "Back To Connect To Database Menu" )
#                 . ~/Bash-Script-Project/Project-Scripts/Connect_To_DB.sh;;
#             * )
#             echo -e "Please , Choose From the above list \n";;
#             esac
#         done
#     else
#         echo -e "Table isn't exist\n"
#     fi
# }
# select_record