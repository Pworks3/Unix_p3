#!/bin/bash

# Philip K. Works III
# Bash Script to Implement the menu for project 3

# Display a basic menu
run=1
while [ $run -eq 1 ]
do
	printf "\r\nMenu Implementation Ver 1.0\n"
	printf "___________________________\n"
	printf "Select an option below:
		 1:\tOperating System Information
		 2:\tHostname and DNS Information
	 	 3:\tNetwork Information
		 4:\tWho is Online?
		 5:\tLast Logged in Users
		 6:\tMy IP Address
		 7:\tMy Disk Usage
		 8:\tMy Home \"File-tree\"
		 9:\tFile Operations
		10:\tExit\r\n
		> "
	read menuInput
	case $menuInput in
		 1) 	printf "___________________________\n"
			printf "System Information\r\n"
			printf "___________________________\n"
			printf "Operating System: Linux\r\n"
			echo "$(lsb_release -a)"
			printf "\r\nPress [enter] key to continue\r\n"
			read osInput 
			 ;;
		 2) printf "\tHost and DNS Information selected\r\n"
			 ;;
		 3) printf "\tNetwork Information selected\r\n"
			 ;;
		 4) printf "\tWho selected\r\n"
			 ;;
		 5) printf "\tLogin selected\r\n"
			 ;;
		 6) printf "\tIP selected\r\n"
			 ;;
		 7) printf "\tDisk selected\r\n"
			 ;;
		 8) printf "\tHome selected\r\n"
			 ;;
		 9) printf "\tFile Op selected\r\n"
			 ;;
		10) run=0
			 ;;
	esac
done



 
