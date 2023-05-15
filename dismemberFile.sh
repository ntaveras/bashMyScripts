#!/bin/bash
<<commentBlock
Description: 
Convert Millions of records/lines into manageble chunks of tens of thousends, or any albitrary number your heart desiers, by using this simple scipt to choose the csv file, and the input the number of lines each output file should have. The file is created in the same folder the target file is in.

Example: 
Big Company file with 100,000 lines is broken down to 10 files, each with 10,000 lines. 
commentBlock
split -l 20 file.txt new 

# Functions
function requestPath(){
  echo "Input a path relative path to the current directory [$DEFAULT_DIR], or leave empty to keep the current directory as the target to be organized."
  read -p "Target CSV file name: " targetFile
  read -p "Number of Row per file: " fileRows
}

#Script
requestPath
split -l $fileRows $targetFile dinmemberedFile/$targetFile/new

exit

