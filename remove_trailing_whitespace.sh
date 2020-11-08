#!/bin/bash

# Ashlyn Hanson
# Program to remove the trailing whitespace of a file.
# This program takes in a text filename as an argument.
# The original file is saved as the filename.text.orig
# The file is emptied and the read command is used to
# replace the original file with a file of the same
# name and writes each line without trailing
# whitespace. The file is then replaced by the same
# file without trailing whitespace. 

if [[ -f $1 ]]
then
  cp -v "$1" "$1.orig"
  file=$1
  originalFile=$1.orig

  # empties the file so that it can
  # be rewritten without trailing
  # whitespace
  cp /dev/null $file
    
  IFS=''
  while read -r line
  do
    # enables extended globbing which
    # allows for more advanced pattern
    # matching
    shopt -s extglob

    # trims the trailing whitespace from
    # each line and writes it to the file
    echo ${line%%+([[:space:]])} >> $file
  done < "$originalFile"
else
  echo "File $1 does not exist"
  exit 1
fi
