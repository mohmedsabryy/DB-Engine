#!/bin/bash
function DeleteCol(){
read -p "Enter column name: " colName;


colNames=($(awk -F: '{print $1}' $table_name))

colFlag=1   #false


for i in "${!colNames[@]}"
do 
    if [[ $colName == "${colNames[$i]}" ]]; then
        colFlag=0   #true
        colNum=$(($i+1));  #column-Number
    fi   
done


if [[ $colFlag == 0 ]]; then


    # delete column from Data/$tableName
    cut -d':' --complement -f$colNum Databases/$currDB/Data/$table_name > Databases/$currDB/Data/$table_name.tmp
    mv Databases/$currDB/Data/$table_name.tmp Databases/$currDB/Data/$table_name

    # delete line containing column from Metadata/$tableName
    sed -i "$colNum"d Databases/$currDB/Metadata/$table_name.metadata
else
    echo "ERROR:In-valid column name.";
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
                            
                            ;;
                        "Select record by PK" )
                            echo -e "Enter a primary key value you want display"
                           
                            ;;
                        "Delete column" )
                                # DeleteCol.sh
                                DeleteCol
                            ;;
                        "Delete record" )  
                                DeleteRow.sh
                                
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
