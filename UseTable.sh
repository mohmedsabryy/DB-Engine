#!/bin/bash


function DeleteRow()
{
    echo  "Enter $(head -1 "$table_name" |
     cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) "
    read pk
    recordNum=$(cut -d ':' -f1 "$table_name" |
     awk '{if(NR != 1) print $0}'| grep -x -n -e "$pk" | cut -d':' -f1)
    if [[ "$pk" == '' ]]; then
        echo "no entry"
 
    elif [[ "$recordNum" = '' ]]; then
        echo  "this primary key doesn't exist"
 
        
    else
        let recordNum=$recordNum+1 
        sed -i "${recordNum}d" "$table_name"
        echo  "record deleted successfully"

        
    fi

}

function DeleteColumn()
{
    echo "Enter Column name"
    read col_name
 awk '
    BEGIN{
        FS=":";
    } 
    {
        if($)
        $col_name=" ";
        print $0;
    }
    END{}

    ' $table_name
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

function SelectByPK()
{
   echo  "Enter $(head -1 "$table_name" |
     cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}') (primary key) "
    read pk
    recordNum=$(cut -d ':' -f1 "$table_name" |
     awk '{if(NR != 1) print $0}'| grep -x -n -e "$pk" | cut -d':' -f1)
      if [[ "$pk" == '' ]]; then
        echo "no entry"

        
    elif [[ "$recordNum" = '' ]]; then
        echo  "this primary key doesn't exist"
 
        
    else
        let recordNum=$recordNum+1 
        sed -n "${recordNum}p" "$table_name"
    fi

}

Use_Table(){
    echo -e "Enter table name \n"
    read table_name ;
    if [ -f $table_name ] ; then
        
        echo ${datatype[@]} ;

        option=("display table" "Select record by PK" "Delete record" "Back to main menu");
        while [[ "$option" != "Back to cennect menu" ]]
        do
            select option in "${option[@]}"
               do
                   case $option in 
                        "display table" ) 

                            DisplayTable

                            ;;
                        "Select record by PK" )
                            SelectByPK
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
