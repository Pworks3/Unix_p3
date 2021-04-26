#!/bin/bash
#____________________________________
# Virginia Tech
# ECE: 3524 Introduction to UNIX for ECE
#____________________________________
# Programmer: 		Philip K. Works III
# Filename: 		script.sh
# Date Created:		Feb 28, 2020
# 
# Description:		This script implements the solution to the first project
#			for ECE 3524.
#
# Script Function:	This script prints a directory tree for a given directory
#			in HTML list format.
#
# Script Inputs:	Input 1: $1 "Root Directory"
#				This is where the site map for the directory tree begins
#
#			Input 2: $2 "Output File"
#				This is the output file the HTML list is printed to
#
# Directions:
#	Invoking:     	$ ./scrip.sh [Root Directory] [Output File]
#		Examples:
#			[Root Directory] -> "." , "./example_dir"
#			[Output File] -> "~/example_out.html"
#
#____________________________________
# FUNCTIONS

# Function to traverse the file system
traverse()
{
	currentPath="$1"		# The current path on this recurse
	outputFile="$2"			# The html outputFile
	if [ -r "$currentPath" ]	# Ensure the file / Directory can be read
	then
		if [ -f "$currentPath" ]	# If file, print file
		then
			echo "<li>$currentPath</li>" >> "$outputFile"
		elif [ -d "$currentPath" ]	# If dir, recurse dir
		then
			echo "<li>$currentPath</li>" >> "$outputFile"
			for files in "$currentPath/"*
			do	
				echo "<ul>" >> "$outputFile"
				traverse "$files" "$outputFile"
				echo "</ul>" >> "$outputFile" 
			done
		fi
	fi
}

# Output file checking function
outputFileCheck()
{
	outputFile="$1"				# Output file to check
	if [ -f "$outputFile" ]			# Check if the desired output file exists
	then					
		echo > "$outputFile"		# Clear the existing file
	else					# File does not exist				
		touch "$outputFile" 		# Create the file
	fi
}

#____________________________________
# MAIN SCRIPT

# Error check to ensure the correct number of arguments were supplied to the script
if [ "$#" -ne "2" ]
then
	echo -e  "Incorrect number of arguments supplied.\n"
	exit 1
fi

# Variables to store the root path supplied and the desired output file
rootPath="$1"
outputFile="$2"

# Check if the desired output file needs to be created
outputFileCheck $outputFile

#configure HTML file
echo "
<html>
	<head>
		<title>
			Philip K. Works III, Project 01
		</title>
	</head>
	<body>
		<h1> 
			Site Map for $rootPath
		</h1>
		<p1>
			<ul>
" >> "$outputFile"
# call traverse function with path specified
traverse $rootPath $outputFile

# configure HTML file
echo "
			</ul>
		</p1>
	</body>
</html>
" >> "$outputFile"
#____________________________________
# END SCRIPT

