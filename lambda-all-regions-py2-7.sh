#!/bin/bash
# YEETUS
for region in `aws ec2 describe-regions --output text | cut -f4`
do
     echo -e "\nListing Lambda with Py2.7 in region:'$region'..."
     aws lambda list-functions --function-version ALL --output text --query "Functions[?Runtime=='python2.7'].FunctionArn" --region $region
done
