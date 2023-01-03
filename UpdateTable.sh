function check_dataType {
	datatype=$(head -1 $2 | cut -d ':' -f$3 | awk -F "-" 'BEGIN { RS = ":" } {print $2}') #$2 TBName $3 ColNum $1 vaule we want to check
	
	if [[ "$1" = ?(-)+([0-9])?(.)*([0-9]) ]]; then
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

echo "-----------------------------------------"
echo Tables :
ls
echo  "------------------------------------------"
	echo  "Enter table name to update"
	read dbtable

	if ! [[ -f "$dbtable" ]]; then
		echo "this table doesn't exist"

	else
		echo "Enter $(head -1 "$dbtable" | cut -d ':' -f1 |\
		awk -F "-" '{print $1}') (primary key)"
		read pk
		
		recordNum=$(cut -d ':' -f1 "$dbtable" | sed '1d'\
		| grep "$pk" | cut -d':' -f1)
		
		if [[ "$pk" == '' ]]; then
			echo "Empty pk input not allowed"

		elif [[ "$recordNum" = '' ]]; then
			echo "this primary key doesn't exist"
			
		else
			let recordNum=$recordNum+1
			num_col=$(head -1 "$dbtable" | awk -F: '{print NF}') 
			echo "record fields: "
			option=$(head -1 $dbtable | awk 'BEGIN{ RS = ":"; FS = "-" } {print $1}')
			echo "$option"
			getFieldName=true
			while $getFieldName; do
				echo   "Enter column name"
				read col_name
				if [[ "$col_name" = '' ]]; then
					echo "invalid entry"

				elif [[ $(echo "$option" | grep -x "$col_name") = "" ]]; then
					echo "field not found"

				else
					fieldnum=$(head -1 "$dbtable" | 
						awk 'BEGIN{ RS = ":"; FS = "-" }
						 {print $1}'\ | grep -x -n "$col_name" | cut -d: -f1)
					updatingField=true
					while $updatingField; do
						if [[ "$fieldnum" = 1 ]]; then #PK
							echo  "Enter new value" 
							read
							check_type=$(check_dataType "$REPLY" "$dbtable" 1)
							pk_used=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}' | grep -x 								-e "$REPLY")
							if [[ "$REPLY" == '' ]]; then
								echo "no entry, id can't be null"

							elif [[ "$check_type" == 0 ]]; then
							echo "5"
								echo "entry invalid"

							elif ! [[ "$pk_used" == '' ]]; then
								echo "this primary key already used"

							else 
								awk -v fn="$fieldnum" -v rn="$recordNum" -v nv="$REPLY"\
								'BEGIN { FS = OFS = ":" } { if(NR == rn)	$fn = nv } 1' 										"$dbtable"\
								> "$dbtable".new && rm "$dbtable" && mv "$dbtable".new "$dbtable"
								updatingField=false
								getFieldName=false
							fi
						else #otherCol
							updatingField=true
							while $updatingField ; do
								echo "Enter new value of column \"$(head -1 $dbtable | cut -d ':' -f$fieldnum |\
								awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" of type $(head -1 "$dbtable" | cut -d ':' -f$fieldnum |\
								awk -F "-" 'BEGIN { RS = ":" } {print $2}')" 
								read
								check_type=$(check_dataType "$REPLY" "$dbtable" "$fieldnum")
								if [[ "$check_type" == 0 ]]; then
									echo "entry invalid"
								else
									awk -v fn="$fieldnum" -v rn="$recordNum" -v nv="$REPLY"\
									'BEGIN { FS = OFS = ":" } { if(NR == rn)	$fn = nv } 1' "$dbtable"\
									> "$dbtable".new && rm "$dbtable" && mv "$dbtable".new "$dbtable"
									updatingField=false
									getFieldName=false
								fi
							done
						fi
					done
						echo "field updated successfully"

				fi
			done
		fi
	fi
