#!/bin/bash

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