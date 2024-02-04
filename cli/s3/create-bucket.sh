#!/bin/bash

# . test-bucket-1983c 

echo "Enter bucket name is $1" 

if [[ -z "$1" ]]; then
        echo "Bucket name is empty"
    else
        aws s3api create-bucket --bucket "$1" --region us-east-1
fi