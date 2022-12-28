
validMetaData=true
#############################  Primary Key    ##############################
while $validMetaData; do
        echo -e "How many columns you want?"
        read numOfColumns
        if [[ "$numOfColumns" =~ ^([1-9])+([0-9])*$ ]]; then # => one or more number
            validMetaData=false
        else
            echo -e "invalid number"
        fi
done

validMetaData=true
while $validMetaData; do
        echo -e "Enter primary key column name"
        read pk_name
        if [[ $pk_name = "" ]]; then
            echo -e "invalid entry, please enter a correct name"
        elif [[ $pk_name =~ ^([a-zA-Z])+([a-zA-Z0-9])*$ ]]; then
        pwd
            echo -n "$pk_name" >> "$tableName"
            echo -n "-" >> "~/DataBase/$name_DB/$tableName"
            validMetaData=false
        else
            echo -e "Primary key can't start with numbers or special characters\e[0m"
        fi
done

validMetaData=true
while $validMetaData; do
        echo -e "Enter primary key datatype"
        select choice in "integer" "string"; do
            if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
                echo -n "$choice" >> "$tableName"
                if [[ $numOfColumns -eq 1 ]]; then
			echo $'\n' >> "$tableName"
		else
			echo -n ":" >> "$tableName"
		fi
                validMetaData=false
            else
                echo -e "invalid choice"
            fi
            break
        done
done

############################# End  Primary Key    ##############################


for (( i = 1; i <= numOfColumns; i++ )); do
        validMetaData=true
        while $validMetaData; do
            echo -e "Enter name of column $[i+1]"
            read field_name
            if [[ $field_name = "" ]]; then
                echo -e "invalid name, please enter a correct name"
                
            elif [[ $field_name =~ ^([a-zA-Z\_])+([a-zA-Z0-9])*$ ]]; then
                echo -n "$field_name" >> "$tableName"
                echo -n "-" >> "$tableName"
                validMetaData=false
            else
                echo -e "field name can't start with numbers or special characters"
            fi

    done
    validMetaData=true
    while $validMetaData; do
            echo -e "Enter column $[i+1] datatype"
            select choice in "integer" "string"; do
                if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
                    echo -n "$choice" >> "$tableName"
                if [[ i -eq $numOfColumns-1 ]]; then
                    echo $'\n' >> "$tableName"
                else
                    echo -n ":" >> "$tableName"
                fi
                validMetaData=false
                else
                    echo -e "invalid choice"

                fi
                break
            done
    done
done
#PS1=$'\e[1;35mChoose from Table Screen : \e[1m'

