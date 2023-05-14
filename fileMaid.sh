#!/bin/bash
<<commentBlock
Description: 
Creates an archived folder in the Desktop and organizes the files withing the folder tree by grouping them into: (1) Files opened in the last seven days [0 - 7 days], (2) Files opened within the las thirty days but not within the last 7 [8 - 30 days], (3) Files opened over thirty days ago [31 - 90 days]. 

Also renames the file to prepend the file name with the date of the last time it was accessed.
commentBlock
DEFAULT_DIR=~+/
function requestPath(){
  read -p "Organize $DEFAULT_DIR, or input a valid path to the directory you'd like to organize: " InputDirectory
}

requestPath

if [ -z "$InputDirectory" ]; then 
targetDirectory=$DEFAULT_DIR
echo "string empty"
else
  echo "string NOT empty."
  if [ -d $InputDirectory ]; then
  echo "valid directory"
  targetDirectory=$InputDirectory
  else
  echo "$InputDirectory is not a directory path."
  requestPath
  fi
fi

function createArchiveDirectoryTree (){
    mkdir -p "$1"
    echo "Created ==> $1"
}

cd "$targetDirectory"

subDirectories=("/archive/Viewed_Less_Then_7_Days_Ago" "/archive/Viewed_Less_Then_30_Days_Ago" "/archive/Viewed_Over_Then_31_Days_Ago" "/archive/Purge_Candidates")
mkdir archive
chmod archive 700
for subDirectory in ${subDirectories[@]}; do
tmp=$targetDirectory$subDirectory
if [ -d "$tmp" ];
then
echo "|| Directory exists ==> $tmp" 
else
createArchiveDirectoryTree $tmp
fi
done



function doFileCleanupMaintenance(){
echo getListOfFiles

}
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