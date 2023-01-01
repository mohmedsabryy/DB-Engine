#!/bin/bash


function DeleteRow()
{
    echo  "Enter $(head -1 "$table_name" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) "
    read
    recordNum=$(cut -d ':' -f1 "$table_name" | awk '{if(NR != 1) print $0}'| grep -x -n -e "$REPLY" | cut -d':' -f1)
    if [[ "$REPLY" == '' ]]; then
        echo "no entry"
 
    elif [[ "$recordNum" = '' ]]; then
        echo  "this primary key doesn't exist"
 
        
    else
        let recordNum=$recordNum+1 
        sed -i "${recordNum}d" "$table_name"
        echo  "record deleted successfully"

        
    fi

}

function DisplayTable()
{

    awk '
    BEGIN{
        FS=":";
    } 
    {
        if(NR>1)
        print $0
    }
    END{}
    ' $table_name

}

Use_Table(){
    echo -e "Enter table name \n"
    read table_name ;
    if [ -f $table_name ] ; then
        
        echo ${datatype[@]} ;

        option=("display table" "Select record by PK" "Delete column"  "Delete record" "Back to main menu");
        while [[ "$option" != "Back to cennect menu" ]]
        do
            select option in "${option[@]}"
               do
                   case $option in 
                        "display table" ) 

                            DisplayTable

                            ;;
                        "Select record by PK" )
                            echo -e "Enter a primary key value you want display"
                           
                            ;;
                        "Delete column" )
                                # DeleteCol.sh
                                DeleteCol
                            ;;
                       "Delete record" )  


                                DeleteRow
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
