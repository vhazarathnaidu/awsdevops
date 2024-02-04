#!/bin/bash


# $vpcid= 
source ./../read_properties_file.sh
getRegion

echo "Finall Region is region"

# aws ec2 create-vpc \
#     --cidr-block "10.0.0.0/16" \
#     --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=fromcli}]" \
#     --region $region \
#     --query "Vpc.VpcId" \
#     --output "text"