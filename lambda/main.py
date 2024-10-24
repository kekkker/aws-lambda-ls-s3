import boto3
import os
import logging
from typing import List
import json

ERROR_MESSAGE = (
    "Something went wrong on our side... Check execution logs for more details."
)


def get_files(bucket_name: str) -> List[str]:
    s3_resource = boto3.resource("s3")
    bucket = s3_resource.Bucket(bucket_name)
    return [obj.key for obj in bucket.objects.all()]


def handler(event, context):
    s3_bucket_name = os.getenv("S3_BUCKET_NAME")
    if not s3_bucket_name:
        logging.error("The S3 bucket name wasn't specified.")
        return {
            "statusCode": 500,
            "statusMessage": "Internal Server Error",
            "isBase64Encoded": False,
            "headers": {"Content-Type": "application/json"},
            "body": f'{{"message": "{ERROR_MESSAGE}"}}',
        }

    try:
        files = get_files(s3_bucket_name)
        return {
            "statusCode": 200,
            "statusMessage": "OK",
            "isBase64Encoded": False,
            "headers": {"Content-Type": "application/json"},
            "body": json.dumps(
                {
                    "files": files,
                }
            ),
        }
    except Exception as e:
        logging.error(f"An error occurred: {e}")
        return {
            "statusCode": 500,
            "statusMessage": "Internal Server Error",
            "isBase64Encoded": False,
            "headers": {"Content-Type": "application/json"},
            "body": f'{{"message": "{ERROR_MESSAGE}"}}',
        }
