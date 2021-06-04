#!/bin/bash
# YEETUS
for region in `aws ec2 describe-regions --output text | cut -f4`
do
     echo -e "\nListing Lambda with Node.js 10 in region:'$region'..."
     aws lambda list-functions --function-version ALL --output text --query "Functions[?Runtime=='nodejs10.x'].FunctionArn" --region $region
done
