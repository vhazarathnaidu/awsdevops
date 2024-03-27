import boto3

# source details
source_aws_access_key_id=''
source_aws_region=''
source_aws_secret_access_key=''
source_bucket=''

# destination details
destination_aws_access_key_id=''
destination_aws_region=''
destination_aws_secret_access_key=''
destination_bucket=''

# object_key = 'posts/0173c352-f9f8-4bf1-a818-c99b4c9b0c18.jpg'
def move_from_s3_to_s3(object_key):
    session_src = boto3.session.Session(source_aws_access_key_id,
                                        source_aws_region,
                                        source_aws_secret_access_key)

    source_s3_r = session_src.resource('s3')

    session_dest = boto3.session.Session(aws_access_key_id="",
                                         region_name="ap-south-1",
                                         aws_secret_access_key="")

    dest_s3_r = session_dest.resource('s3')
    # create a reference to source image
    old_obj = source_s3_r.Object(source_bucket, object_key)

    # create a reference for destination image
    new_obj = dest_s3_r.Object(destination_bucket, object_key)

    # upload the image to destination S3 object
    new_obj.put(Body=old_obj.get()['Body'].read())