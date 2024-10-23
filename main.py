import boto3
import botocore

def handler(event, context):
    # TODO implement
    return {
"statusCode": 200,
"statusDescription": "200 OK",
"isBase64Encoded": False,
"headers": {
"Content-Type": "application/json"
},
"body": '{"message": "hey"}'
}
