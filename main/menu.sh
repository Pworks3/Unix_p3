#!/bin/bash

# Philip K. Works III
# Bash Script to Implement the menu for project 3

# Display a basic menu
run=1
while [ $run -eq 1 ]
do
	echo "$(date)"
	printf "___________________________\n"
	printf "Select an option below [1..10]:
		 1:\tOperating System Information
		 2:\tHostname and DNS Information
	 	 3:\tNetwork Information
		 4:\tWho is Online?
		 5:\tLast Logged in Users
		 6:\tMy IP Address
		 7:\tMy Disk Usage
		 8:\tMy Home \"File-tree\"
		 9:\tFile Operations
		10:\tExit\n
		> "
	read menuInput
	case $menuInput in
		 1) 	printf "___________________________\n"
			printf "System Information\n"
			printf "___________________________\n"
			printf "Operating System: Linux\n"
			echo "$(lsb_release -a)"
			printf "\nPress [enter] key to continue\n"
			read osInput 
			 ;;
		 2)     printf "___________________________\n"
			printf "Hostname and DNS Information\n"
			printf "___________________________\n"
			echo "Hostname: $(hostname)"
			echo "DNS Domain: $(hostname -d)"
			echo "Fully qualified domain name: $(hostname -f)"
			echo "Network address (IP) : $(hostname -i)"
			echo "DNS name servers (DNS IP) : "$(grep nameserver /etc/resolv.conf)""
			printf "\nPress [enter] to continue\n"
			read dnsInput
			 ;;
		 3)     printf "___________________________\n"
			printf "Network Information\n"
			printf "___________________________\n"
			numIF=$(ip link show | wc -l)
			printf "Total network interfaces found : %i\n" "$((numIF / 2))"
		       	echo  "$(ip link show)"
			printf "\n*-*-*-*-*-*-*-*-*-*-*-*-*-*\n"
			printf "* * * Network Routing * * *\n"
			printf "*-*-*-*-*-*-*-*-*-*-*-*-*-*\n"
			echo "$(route -e)"
			printf "\n*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n"
			printf "* Interface Traffic Information *\n"
			printf "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*\n"
			echo "$(netstat -i)"
			printf "\nPress [enter] to continue\n"
			read nwInput
			;;
		 4) 	printf "___________________________\n"
			printf "Who is Online?\n"
			printf "___________________________\n"
			echo "$(w)"
			printf "\nPress [enter] to continue\n"
		        read wInput	
			;;
		 5)     printf "___________________________\n"
			printf "Last Logged In Users\n"
			printf "___________________________\n"
			echo "$(last -w)"
			printf "\nPress [enter] to continue\n"
			read lInput
			;;
		 6) 	printf "___________________________\n"
			printf "Public IP Information\n"
			printf "___________________________\n"
			echo "$(dig +short myip.opendns.com @resolver1.opendns.com)"
			printf "\nPress [enter] to continue\n"
			read ipInput
			 ;;
		 7) 	printf "___________________________\n"
			printf "Disk Usage Information\n"
			printf "___________________________\n"
			echo "$(df --total -hl)"
			printf "\nPress [enter] to continue\n"
			read dInput
			 ;;
		 8)	printf "___________________________\n"
			printf "Home File Tree\n"
			printf "___________________________\n"
			./script.sh ~/ treefile.html
			printf "\nTree has been printed ot an HTML file\n"
			printf "\nPress [enter] to continue\n"
			read tInput
			 ;;
		 9) 	printf "\t\tTHIS OPTION IS NOT CURRENTLY AVAILABLE\n"
			printf "\nPress [enter] to continue\n"
			read opInput
		       	 ;;
		10) 	run=0
			 ;;
	   	 *) 	printf "Invalid Option\n"
		   	printf "\nPress [enter] to continue\n"
			read dInput
		   	 ;; 
	esac
done



 
