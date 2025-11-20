 variable "ec2_instance_web_ami" {
    description = "The AMI ID for the web EC2 instance"
    type        = string
 }
variable "ec2_intance_web_name" {
    description = "The name tag for the web EC2 instance"
    type        = string
}
variable "ec2_instance_web_quantity" {
    description = "The number of web EC2 instances to launch"
    type        = number
}
variable "ec2_instance_web_subnet_id" {
    description = "The subnet ID where the web EC2 instances will be launched"
    type        = string
}
variable "ec2_instance_web_type" {
    description = "The instance type for the web EC2 instances"
    type        = string
}
variable "ec2_keypair" {
    description = "The key pair name for the EC2 instances"
    type        = string
}
variable "ec2_instance_web_user_data" {
    description = "The user data script for the web EC2 instances"
    type        = string
}
variable "vpc_id" {
    description = "The VPC ID where the EC2 instances will be launched"
    type        = string
}