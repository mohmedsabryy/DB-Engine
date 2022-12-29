function check_dataType {
	datatype=$(head -1 $2 | cut -d ':' -f$3 | awk -F "-" 'BEGIN { RS = ":" } {print $2}')
	
	if [[ "$1" = '' ]]; then
		echo 0
	elif [[ "$1" = -?(0) ]]; then
		echo 0 
	elif [[ "$1" = ?(-)+([0-9])?(.)*([0-9]) ]]; then
		if [[ $datatype == integer ]]; then
			echo 1
		else

			echo 1
		fi
	else
		if [[ $datatype == integer ]]; then

			echo 0 
		else

			echo 1
		fi
	fi
}

if  [[ -z "$(ls -A $PWD)"  ]] 
then
    echo -e "No tables available!"
else

	echo Tables :
	ls
	echo -e "Enter table name"
	read dbtable
	if ! [[ -f "$dbtable" ]]; then
		echo -e "this table doesn't exist"
	else
		insertingData=true
		while $insertingData ; do
			echo -e "Enter value of column $(head -1 "$dbtable" | cut -d ':' -f1 | cut -d '-' -f1) of type $(head -1 "$dbtable" | cut -d ':' -f1 | cut -d '-' -f2) ( primary key )" 
			read

			check_type=$(check_dataType "$REPLY" "$dbtable" 1)
			pk_used=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}' | grep -x -e "$REPLY")
			 
			if [[ "$REPLY" == '' ]]; then
				echo -e "no entry"



			elif ! [[ $REPLY =~ [A-Za-z0-9\_] ]]; then
				echo -e "You can't enter these characters => . / : - |"



			elif [[ "$check_type" == 0 ]]; then 
				echo -e "entry invalid"



			elif ! [[ "$pk_used" == '' ]]; then
				echo -e "this primary key is already used"



			else 
				if [[ $num_col == 1 ]]; then
					echo "$REPLY" >> "$dbtable"
					inserting_other_data=false
					insertingData=false
					echo -e "entry inserted successfully"

				
				else
				inserting_other_data=false
				echo -n "$REPLY" >> "$dbtable"
				echo -n ':' >> "$dbtable"
				fi


				num_col=$(head -1 "$dbtable" | awk -F: '{print NF}')
				for (( i = 2; i <= num_col; i++ )); do
					inserting_other_data=true
					while $inserting_other_data ; do
						echo -e "Enter value of column $(head -1 "$dbtable" | cut -d ':' -f$i | cut -d '-' -f1) of type $(head -1 "$dbtable" | cut -d ':' -f$i | cut -d '-' -f2)"
						read
						check_type=$(check_dataType "$REPLY" "$dbtable" "$i")
						if [[ "$check_type" == 0 ]]; then
							echo -e "entry invalid"
							
						elif ! [[ $REPLY =~ [A-Za-z0-9\_] ]]; then
							echo -e "You can't enter these characters => . / : - |"
							
						else
							if [[ i -eq $num_col ]]; then
								echo "$REPLY" >> "$dbtable"
								inserting_other_data=false
								insertingData=false
								echo -e "entry inserted successfully"
								
							else
								echo -n "$REPLY": >> "$dbtable"
								inserting_other_data=false
							fi
						fi
					done
				done
			fi
		done
	fi
fi
