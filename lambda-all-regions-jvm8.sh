#!/bin/bash
# YEETUS
for region in `aws ec2 describe-regions --output text | cut -f4`
do
     echo -e "\nListing Lambda with Java 8 in region:'$region'..."
     aws lambda list-functions --function-version ALL --output text --query "Functions[?Runtime=='java8'].FunctionArn" --region $region
done
