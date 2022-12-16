import boto3
import os
from dotenv import load_dotenv

load_dotenv()
AWS_ACCESS_KEY=os.getenv('AWS_ACCESS_KEY')
AWS_SECRET_ACCESS_KEY=os.getenv('AWS_SECRET_ACCESS_KEY')
django_secret_key=os.getenv('DJANGO_SECRET_KEY')
BUCKET_URL=os.getenv('BUCKET_URL')

BUCKET_NAME="online-library-neo" 
bucket=boto3.resource('s3',aws_access_key_id=AWS_ACCESS_KEY, aws_secret_access_key = AWS_SECRET_ACCESS_KEY,region_name="ap-south-1") 