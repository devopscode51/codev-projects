#!/bin/bash  

# Check if the current day is odd  
is_odd_day() {  
    day=$(date +%d)  
    if (( day % 2 != 0 )); then  
        return 0  # true  
    else  
        return 1  # false  
    fi  
}  

# Reboot the specified EC2 instance  
reboot_instance() {  
    instance_id=$1  
    aws ec2 reboot-instances --instance-ids "$instance_id"  
    return $?  # return the exit status of the previous command  
}  

# Publish a message to the specified SNS topic  
publish_sns_message() {  
    sns_topic=$1  
    message=$2  
    aws sns publish --topic-arn "$sns_topic" --message "$message"  
}  

# Main function to check the day, reboot instance, and publish message  
main() {  
    instance_id=$1  
    sns_topic=$2  
    
    if is_odd_day; then  
        echo "Today is an odd day. Attempting to reboot instance $instance_id..."  
        reboot_instance "$instance_id"  
        if [ $? -eq 0 ]; then  
            publish_sns_message "$sns_topic" "Successfully rebooted instance $instance_id."  
        else  
            publish_sns_message "$sns_topic" "Failed to reboot instance $instance_id."  
        fi  
    else  
        echo "Today is not an odd day, no action taken."  
        publish_sns_message "$sns_topic" "No action taken as today is not an odd day."  
    fi  
}  

# Check for the correct number of arguments  
if [ "$#" -ne 2 ]; then  
    echo "Usage: bash reboot_ec2.sh <instance_id> <sns_topic>"  
    exit 1  
fi  

# Call the main function with provided arguments  
main "$1" "$2"