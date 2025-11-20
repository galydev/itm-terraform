variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "aws_shared_credentials_files" {
  description = "Path to the shared credentials file"
  type        = string
  default     = "~/.aws/credentials"
}

variable "aws_profile" {
  description = "The AWS profile to use from the shared credentials file"
  type        = string
  default     = "default"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = map(string)
  default     = {
    default = "192.168.8.0/25"
    dev     = "192.168.8.0/25"
  }
}

variable "vpc_subnet_cidr_block_frontend_web_1" {
  description = "The CIDR block for the subnet Frontend/Web"
  type        = map(string)
  default     = {
    default = "192.168.8.0/27"
    dev     = "192.168.8.0/27"
  }
}
variable "vpc_subnet_cidr_block_backend_db_1" {
  description = "The CIDR block for the subnet Backend/Database"
  type        = map(string)
  default     = {
    default = "192.168.8.32/27"
    dev     = "192.168.8.32/27"
  }
}
variable "vpc_subnet_cidr_block_frontend_web_2" {
  description = "The CIDR block for the subnet Frontend/Web 2"
  type        = map(string)
  default     = {
    default = "192.168.8.64/27"
    dev     = "192.168.8.64/27"
  }
}
variable "vpc_subnet_cidr_block_backend_db_2" {
  description = "The CIDR block for the subnet Backend/Database 2"
  type        = map(string)
  default     = {
    default = "192.168.8.96/27"
    dev     = "192.168.8.96/27"
  }
}

variable "aws_keypair" {
  type = map(string)
  default = {
    default = "ItmVSCodeLab1_Web_KeyPair_2025"
    dev     = "ItmVSCodeLab1_Web_KeyPair_2025"
  }
}

variable "ec2_instance_web_ami" {
  description = "The AMI ID for the web EC2 instance"
  type        = map(string)
  default     = {
    default = "ami-085386e29e44dacd7" # Amazon Linux 2 AMI
    dev     = "ami-085386e29e44dacd7"
  }
}

variable "ec2_intance_web_name" {
  description = "The name tag for the web EC2 instance"
  type        = map(string)
  default     = {
    default = "ItmVSCodeLab1_WebServer_Default"
    dev     = "ItmVSCodeLab1_WebServer_Dev"
  }
  
}

variable "ec2_instance_web_quantity" {
  description = "The number of web EC2 instances to launch"
  type        = map(number)
  default     = {
    default = 1
    dev     = 1
  }
}

variable "ec2_instance_web_type" {
  description = "The type of web EC2 instance"
  type        = map(string)
  default     = {
    default = "t2.micro"
    dev     = "t2.micro"
  }
} 

variable "ec2_keypair" {
  description = "The name of the key pair to use for EC2 instances"
  type        = map(string)       
  default     = {
    default = "ItmVSCodeLab1_Web_KeyPair"
    dev     = "ItmVSCodeLab1_Web_KeyPair"
  }
}

variable "ec2_instance_web_user_data" {
  description = "The user data to use for the web EC2 instance"
  type        = map(string)
  default     = {
    default = "#!/bin/bash\nyum update -y\namazon-linux-extras install -y nginx1\nsystemctl start nginx\nsystemctl enable nginx\necho '<h1>Welcome to ItmVSCodeLab1 Web Server</h1>' > /usr/share/nginx/html/index.html"
    dev     = "#!/bin/bash\nyum update -y\namazon-linux-extras install -y nginx1\nsystemctl start nginx\nsystemctl enable nginx\necho '<h1>Welcome to ItmVSCodeLab1 Web Server</h1>' > /usr/share/nginx/html/index.html"
  }
}

