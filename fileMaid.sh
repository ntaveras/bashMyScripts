#!/bin/bash
<<commentBlock
Description: 
Creates an archived folder in the Desktop and organizes the files withing the folder tree by grouping them into: (1) Files opened in the last seven days [0 - 7 days], (2) Files opened within the las thirty days but not within the last 7 [8 - 30 days], (3) Files opened over thirty days ago [31 - 90 days]. 

Also renames the file to prepend the file name with the date of the last time it was accessed.
commentBlock

desktopDirectory=~/Desktop/ 
[ -d "${desktopDirectory}" ] && echo "Directory exists." || createArchiveDirectoryTree

function createArchiveDirectoryTree(){
    mkdir -p "${desktopDirectory}/archive/Viewed_Less_Then_7_Days_Ago"
    mkdir -p "${desktopDirectory}/archive/Viewed_Less_Then_30_Days_Ago"
    mkdir -p "${desktopDirectory}/archive/Viewed_Over_Then_31_Days_Ago"
    mkdir -p "${desktopDirectory}/archive/Purge_Candidates"
}

function doFileClean-upMaintenance(){
echo getListOfFiles

}

function getListOfFiles(){
for file in "${desktopDirectory}/*"
do
  echo "$entry"
done
}

function updateFileName(){

}