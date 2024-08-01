Exam #3:
    Using BASH or Python,
        1. create a script that checks if the current day of the month is an odd number, and if it is,
        2. reboot an EC2 instance and then
        3. publish a message to an SNS topic stating whether it was successful or not.
    
    Assume the following:
        1. The instance ID is I-123456789
        2. The SNS topic is Devops-Alerts
        3. BONUS: Allow us to specify an EC2 Instance ID and a SNS topic so that we can verify your code in AWS