#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo 'build_and_deploy.sh <BUCKET_NAME>'
    echo '  <BUCKET_NAME> -   S3 Bucket Name'
    exit 1
fi

bucket_name=$1

aws cloudformation package --template-file layer.yaml --output-template-file layer-output.yaml --s3-bucket $bucket_name
aws cloudformation deploy --template-file layer-output.yaml --stack-name lambda-layer-example-stack --capabilities CAPABILITY_NAMED_IAM