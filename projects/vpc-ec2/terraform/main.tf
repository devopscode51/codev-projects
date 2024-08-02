# provider block to specify AWS as the provider with the desired region  
provider "aws" {  
  region = "us-west-2"  # Change to your desired AWS region  
}  

# Create a VPC  
resource "aws_vpc" "main" {  
  cidr_block = "10.0.0.0/16"  # The main CIDR block for the VPC  

  tags = {  
    Name = "MainVPC"  
  }  
}  

# Create a Subnet within the VPC  
resource "aws_subnet" "main" {  
  vpc_id     = aws_vpc.main.id     # Reference to the VPC  
  cidr_block = "10.0.1.0/24"       # CIDR block for the subnet  
  availability_zone = "us-west-2a" # Choose an AZ within your region  

  tags = {  
    Name = "MainSubnet"  
  }  
}  

# Create a Security Group allowing access to port 443 (HTTPS)  
resource "aws_security_group" "allow_https" {  
  vpc_id = aws_vpc.main.id  # Reference to VPC  

  ingress {  
    from_port   = 443  
    to_port     = 443  
    protocol    = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]  # Allow from anywhere  
  }  

  egress {  
    from_port   = 0  
    to_port     = 0  
    protocol    = "-1"            # Allow all outbound traffic  
    cidr_blocks = ["0.0.0.0/0"]  # Allow from/to anywhere  
  }  

  tags = {  
    Name = "AllowHttps"  
  }  
}  

# Create an EC2 instance in the previously created subnet  
resource "aws_instance" "web_server" {  
  ami           = "ami-0c55b159cbfafe1f0"  # Change to an appropriate AMI ID (Amazon Linux 2 in this example)  
  instance_type = "t2.micro"               # Choose an appropriate instance type  
  subnet_id     = aws_subnet.main.id       # Reference the subnet  
  associate_public_ip_address = true        # Assign a public IP  
  key_name      = "my-key-pair"             # Change to your SSH key pair name  

  # Configure the root block device   
  root_block_device {  
    volume_size = 100  # Set volume size to 100 GB  
    volume_type = "gp2" # General Purpose SSD  
  }  

  # Use the security group created earlier  
  vpc_security_group_ids = [aws_security_group.allow_https.id]  

  tags = {  
    Name = "WebServer"  
  }  
}  

# Output EC2 public IP  
output "ec2_public_ip" {  
  value = aws_instance.web_server.public_ip  
}