#!/bin/bash


file="./config.properties"
#read the properties file and returns the value based on the key
function getPropVal {
if [ -f "$file" ]
then
  echo "$file found."

  value= grep "${1}" ./$file|cut -d '=' -f2
	if [[ -z "$value" ]]; then
	   echo "Key not found"
	   exit 1
	fi
	echo $value
else
  echo "$file not found."
fi
    
}

#Get the value with key
function getRegion {
    NAME=($(getPropVal 'config.region'))
    echo $NAME 
}

getRegion