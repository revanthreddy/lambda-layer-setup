#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo 'build_and_deploy.sh <BUCKET_NAME>'
    echo '  <BUCKET_NAME> -   S3 Bucket Name'

    exit 1
fi

bucket_name=$1

sam build
sam deploy --stack-name lambda-layers-example-stack  --region us-east-1 --confirm-changeset False --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM --s3-bucket $bucket_name


