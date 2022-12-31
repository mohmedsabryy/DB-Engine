#!/usr/bin/bash 

function MenuDB() {
    ADVSEL=$(whiptail --title "Menu" --fb --menu "Select options"  15 60 4 \
    "1" "CreateDB" \
    "2" "ShowDBs" \
    "3" "UseDB" \
    "4" " DropDB" \
    "5" "Exit" 3>&1 1>&2 2>&3 )
        
    case $ADVSEL in

    1)
    echo "CreateDB"
    
    CreateDatabase.sh
    ;;
    2)
    echo "ShowDBs"
    ShowDatabase.sh
    ;;
    3)
    echo "UseDB"
    
    connect_to_DB.sh
    ;;
    4)
    echo "DropDB"
    
    DropDatabase.sh
    ;;
    5)
    echo "Exit"
     break
    ;;
    *) 
         echo "default"
    esac

}


if [ -d ~/DataBase ] ; then 
    cd ~/DataBase
    MenuDB
else 
    mkdir ~/DataBase
    echo "DataBase Folder Created!"
    cd ~/DataBase
fi

# select choice in CreateDB ShowDBs UseDB DropDB Exit
# do 
#     case $choice in 
#         CreateDB )
#         	CreateDatabase.sh
#         ;; 
#         ShowDBs ) 
#         	ShowDatabase.sh
#         ;;
       
#         UseDB )
#         	connect_to_DB.sh
#         ;;
#          DropDB )
#         	DropDatabase.sh
#         ;;
#         Exit )
#             break
#         ;;
#         *) 
#          echo "default"
#     esac
# done
