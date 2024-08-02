#!/usr/bin/env python3  

import boto3  
import datetime  
import sys  

# Function to check if the current day is odd  
def is_odd_day():  
    today = datetime.date.today()  
    return today.day % 2 != 0  

# Function to reboot the EC2 instance  
def reboot_instance(instance_id):  
    ec2_client = boto3.client('ec2')  
    try:  
        response = ec2_client.reboot_instances(InstanceIds=[instance_id])  
        return response['ResponseMetadata']['HTTPStatusCode'] == 200  # Return true if successful  
    except Exception as e:  
        print(f"Failed to reboot instance {instance_id}: {str(e)}")  
        return False  

# Function to publish a message to the SNS topic  
def publish_sns_message(sns_topic, message):  
    sns_client = boto3.client('sns')  
    try:  
        sns_client.publish(TopicArn=sns_topic, Message=message)  
        print(f"Message published to SNS topic {sns_topic}: {message}")  
    except Exception as e:  
        print(f"Failed to publish message to SNS topic {sns_topic}: {str(e)}")  

# Main function to check the day, reboot instance, and publish message  
def main(instance_id, sns_topic):  
    if is_odd_day():  
        print(f"Today is an odd day. Attempting to reboot instance {instance_id}...")  
        success = reboot_instance(instance_id)  
        if success:  
            publish_sns_message(sns_topic, f"Successfully rebooted instance {instance_id}.")  
        else:  
            publish_sns_message(sns_topic, f"Failed to reboot instance {instance_id}.")  
    else:  
        print("Today is not an odd day, no action taken.")  
        publish_sns_message(sns_topic, "No action taken as today is not an odd day.")  

# Script entry point  
if __name__ == "__main__":  
    if len(sys.argv) != 3:  
        print("Usage: python reboot_ec2.py <instance_id> <sns_topic>")  
        sys.exit(1)  
    
    instance_id = sys.argv[1]  
    sns_topic = sys.argv[2]  
    main(instance_id, sns_topic)