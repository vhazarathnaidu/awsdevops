import boto3

client = boto3.client('ec2', region_name='us-east-1')

instance_tags = client.describe_instances(
    Filters=[
        {
            'Name': 'tag:Environment',
            'Values': [
                'Dev',
            ]
        },
        {
            'Name': 'instance-state-name', 
            'Values': [
                'running',
            ]
        }    
    ],
)

ids= [instance['InstanceId']
    for reservation in instance_tags['Reservations']
    for instance in reservation['Instances']]
    
response = client.stop_instances(
        InstanceIds=ids
)