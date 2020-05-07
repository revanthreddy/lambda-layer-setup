# Lambda Layers Setup

The goal of this code is to learn how to leverage AWS Lambda layers to store the common libraries/dependencies to reduce the size of your lambda deployment package.
This repo contains source code and supporting files including the libraries to do teach you how to setup and use lambda layers. We use SAM style deployment of the code (using cloudformation package and deploy commands)


## Step.1 Prerequisites 

* AWS CLI (with enough privileges to run the below commands)
* IDE (Like Pycharm, VS Code or which ever floats your boat)
* Create an S3 bucket that we will use as part CloudFormation package and deploy commands and remember the name (or use an existing one)

```bash
$ aws s3 mb s3://{YOUR_TEMP_BUCKET_NAME}
```


## Step.2 Package and Deploy with the existing layer.yaml

* In the current project root run the below commands

```bash
$ sh build_and_deploy.sh {YOUR_TEMP_BUCKET_NAME}
```

The above step will kick off a cloudformation stack by the name "lambda-layer-example-stack". Below are the resources that are created by the stack.

- AWS Lambda layer containing the `aws-xray-sdk` library and a common custom function such as `custom.js` that is used in our lambda code
- AWS Lambda function to which the above is layer is attached and the code refers the library (look at index.js under the lambda_source folder)


NOTE: The structure in which you store the library of the layer source code differs from runtime to runtime . [Refer to this document for different runtimes](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-path) 


## Step.3 TESTING

- In your AWS Lambda console open your function `lamda-to-test-layer` and create a sample test event (it can be anything), save it and run it.
Your function should execute smoothly.
- Let's try a sad path. In the same lambda console of the function detach the lambda layer and then rerun the test. It should fail with an import package error. 


## Step.4 CLEANUP

* Delete the `lambda-layer-example-stack` from the cloudformation console

