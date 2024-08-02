## Project Description (AWS VPC and EC2)
This repository provide configurations using both Terraform and AWS CloudFormation. These configurations will create a VPC, a subnet, an EC2 instance, and a security group with the specified requirements.


## Usage

`For Terraform`:
    1. Install Terraform if you haven't already.
    2. Save the Terraform configuration to a file named main.tf.
    3. Open a terminal and navigate to the folder containing main.tf.
    4. Run the following commands:
        terraform init       # Initialize the Terraform configuration  
        terraform plan       # Review the plan  
        terraform apply      # Apply the configuration to create resources  

    Note: After a successful apply, Terraform will output the public IP of the EC2 instance.

`For CloudFormation`:
    1. Log into your AWS Management Console.
    2. Navigate to the CloudFormation service.
    3. Click on Create Stack > With new resources (standard).
    4. Upload the CloudFormation YAML template file or paste its content directly.
    5. Follow the prompts, specifying any required parameters (like Key Name).
    6. Click on Create Stack and wait for the stack to create the resources.
    7. Once created, you can view the outputs section to find the public IP of the EC2 instance.

    Note: Feel free to adjust any parameters specific to your environment, such as AMI IDs, Key Pair names, and regions.