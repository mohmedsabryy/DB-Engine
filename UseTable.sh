#!/bin/bash

deleteRow(){
     echo -e "\e[1;36mEnter $(head -1 "$table_name" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) \e[0m"
    read
    recordNum=$(cut -d ':' -f1 "$table_name" | awk '{if(NR != 1) print $0}'| grep -x -n -e "$REPLY" | cut -d':' -f1)
    if [[ "$REPLY" == '' ]]; then
        echo    "mno entry"
        echo -e "36mpress Enter to continue"
        read
        clear
    elif [[ "$recordNum" = '' ]]; then
        echo -e "\e[41mthis primary key doesn't exist\e[0m"
        echo -e "\e[1;36mpress Enter to continue\e[0m"
        read
        clear
    else
        let recordNum=$recordNum+1 
        sed -i "${recordNum}d" "$table_name"
        echo -e "\e[42mrecord deleted successfully\e[0m"
        echo -e "\e[1;36mpress Enter to continue\e[0m"
        read
        clear
    fi

}

Use_Table(){
    echo -e "Enter table name \n"
    read table_name ;
    if [ -f $table_name ] ; then
        # Metadata.sh
        # read primary_key <<< $(sed '2!d' $table_name) ;
        # read -a columns <<< $(sed '4!d' $table_name) ;
        # read -a datatype <<< $(sed '6!d' $table_name) ;
        # echo -e "Columns of the table : \n ${columns[@]} \n"
        # echo -e "The Column index which have the primary key constraint : \n $primary_key \n"
        # echo -e "The data type for each column ( integer , string )\n"
        echo ${datatype[@]} ;

        option=("display table" "Select record by PK" "Delete column"  "Delete record" "Back to main menu");
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
                                deleteRow
                                # DeleteRow.sh
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
