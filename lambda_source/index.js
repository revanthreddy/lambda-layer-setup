const AWSXRay = require('aws-xray-sdk');
const CustomClass = require('/opt/nodejs/custom')

const custom = new CustomClass();

exports.handler = async (event) => {
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify('Hello from Lambda!'),
    };
    console.log(custom.invoke());
    return response;
};
