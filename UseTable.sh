#!/bin/bash

Use_Table(){
    echo -e "Enter table name \n"
    read table_name ;
    if [ -f $table_name ] ; then
        # Metadata.sh
        read primary_key <<< $(sed '2!d' $table_name) ;
        read -a columns <<< $(sed '4!d' $table_name) ;
        read -a datatype <<< $(sed '6!d' $table_name) ;
        echo -e "Columns of the table : \n ${columns[@]} \n"
        echo -e "The Column index which have the primary key constraint : \n $primary_key \n"
        echo -e "The data type for each column ( integer , string )\n"
        echo ${datatype[@]} ;

        option=("display table" "Select record by PK" "Delete column" "Delete record" "Back to main menu");
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
                        "Delete column" )
                                DeleteCol.sh
                            ;;
                        "Delete record" )
                                DeleteRec.sh
                            ;;
                        "Back to main menu" )
                        MainMenu.sh 
                        ;;
                        *)
                        echo -e "Please , Choose From the above list \n";
                    esac
            done
    
        done
    else
        echo -e "Table isn't exist\n"
    fi
  
}
Use_Table ;
