#!/bin/bash
<<commentBlock
Description: 
Creates an archived folder in the Desktop and organizes the files withing the folder tree by grouping them into: (1) Files opened in the last seven days [0 - 7 days], (2) Files opened within the las thirty days but not within the last 7 [8 - 30 days], (3) Files opened over thirty days ago [31 - 90 days]. 

Also renames the file to prepend the file name with the date of the last time it was accessed.
commentBlock

# Functions
function requestPath(){
  echo "Input a path relative path to the current directory [$DEFAULT_DIR], or leave empty to keep the current directory as the target to be organized."
  read -p "Target path: " InputDirectory
}

function validateInputPath(){
  if [ -z "$1" ]; then 
  targetDirectory=$DEFAULT_DIR
  else
    if [ -d $1 ]; then
    echo "valid directory"
    targetDirectory=$DEFAULT_DIR$1
    else
    echo "$1 is not a directory path." 
    echo ""
    requestPath
    fi
  fi
}

function createArchiveDirectoryTree (){
    mkdir -p "$1"
    echo "Created ==> $1"
}

function createArchivalDirectories(){
subDirectories=("archive/Viewed_Less_Then_7_Days_Ago" "archive/Viewed_Less_Then_30_Days_Ago" "archive/Viewed_Over_Then_31_Days_Ago" "archive/Purge_Candidates")
for subDirectory in ${subDirectories[@]}; do
  tmp=$subDirectory
  [ ! -d "$subDirectory" ] && createArchiveDirectoryTree $subDirectory
done
}

function getLastAccessedAgeInDays() {
  SECONDS_IN_A_DAY=86400
  file_path="$1"
  current_time=$(date +%s)
  access_time=$(stat -c %X "$file_path")
  seconds_diff=$((current_time - access_time))
  age_in_days=$((seconds_diff / SECONDS_IN_A_DAY))  # 86400 seconds in a day
  echo "$age_in_days"
}

function getListOfFIles(){
  echo "$targetDirectory"
  for file in "/*"; do
    echo "$file" #stat -f "%Sm" -t "%Y-%m-%d %H:%M"
  done
}

#Script 
DEFAULT_DIR=~+/ #current directory
requestPath
validateInputPath $InputDirectory
cd "$targetDirectory"
createArchivalDirectories
getListOfFiles

#function doFileCleanupMaintenance(){
#}



exit

#function getListOfFiles(){
#for file in "${targetDirectory}/*"
#do
#  echo "$entry" #stat -f "%Sm" -t "%Y-%m-%d %H:%M" <- Provides last 
  #Get all Documents in Desktop or in folder within the desktop
  #Loop over files
  #     Rename to "dateLastOpened_File Name
  #     Mv the file to of the three folder according to how long it was since last time it was modified
#done
#}