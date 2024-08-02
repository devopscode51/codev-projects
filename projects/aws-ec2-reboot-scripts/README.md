# Project Description (AWS EC2 Reboot Scripts)  

This repository contains scripts for rebooting an AWS EC2 instance based on whether the current day is even or odd. It includes implementations in both Bash and Python.  

## Directory Structure  

- `bash/`: Contains the Bash implementation of the EC2 reboot script.  
- `python/`: Contains the Python implementation of the EC2 reboot script.  
- `docs/`: Contains additional documentation.  
  
## Usage  

### Bash Script  

1. Navigate to the bash directory:  
    ```bash  
    cd bash  
    ```  
2. Make the script executable:  
    ```bash  
    chmod +x reboot_ec2.sh  
    ```  
3. Run the script with the following command:  
    ```bash  
    ./reboot_ec2.sh <instance_id> <sns_topic>  
    ```  

### Python Script  

1. Navigate to the python directory:  
    ```bash  
    cd python  
    ```  
2. Install the required dependencies:  
    ```bash  
    pip install boto3  
    ```  
3. Run the script with the following command:  
    ```bash  
    python3 reboot_ec2.py <instance_id> <sns_topic>  
    ```  

## Dependencies  

- For the Bash script:  
  - AWS CLI with configured credentials.  
  
- For the Python script:  
  - Boto3 library.  

## Additional Documentation  

Refer to the docs folder for additional details and usage instructions.