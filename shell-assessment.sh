#!/bin/bash
#Lewis Brogan, 06016658, MUOS Assessment 3
#clears the terminal before showing program
clear 
#Echo 1-5 shows all options to the user at beginning
echo "1): Delete a specific file"
echo "2): Display contents of a specific file"
echo "3): Show all system processes"  
echo "4): List all files and directories"
echo "5): Exit"

read option
echo " "
#prompt for user to select a choice.
PS3="Please enter your choice: " 
#choose from 1-5
select choice in "1" "2" "3" "4" "5" 

do
#start of main script
#echo one is to enter the file name the user wishes to delete
case $choice in 
  1) echo "Please enter the filename you wish to delete" , 
     read myFile
     echo "    "
#removes file specified by user
     if [ ! -f $myFile ];
     then 
      echo "File does not exist"
     else 
      rm $myFile 
      echo "File deleted"
     fi
     ;;
#start of echo 2 which allows the user to view certain files
  2) echo "Please enter the filename you wish to view"
      read myFile
      echo "    "
#this command detects if the file doesn’t exist and displays an error message
     if [ ! -f $myFile ];
    then 
    echo " File does not exist"
     else 
#this displays the contents of a file the user types on the screen
      cat -n $myFile
      echo "The number of words in this document is:" 
#command for displaying number of words in a specific document
      wc -w<$myFile
     fi
     ;;
#echo 3 allows the user to see all the processes being carried out by the system
  3) ps -aux
     ;;
#echo 4 displays all the directories on screen from your home directory.
  4) ls $HOME -a 
     ;;
#echo 5 allows the user to exit
  5) exit 
     ;;
  *) echo "invalid Option" 
     ;;
esac
done
