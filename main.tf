module "VPC" {
    source = "./modules/VPC"
    vpc_cidr_block = var.vpc_cidr_block[terraform.workspace]
    vpc_subnet_cidr_block_frontend_web_1 = var.vpc_subnet_cidr_block_frontend_web_1[terraform.workspace]
    vpc_subnet_cidr_block_backend_db_1 = var.vpc_subnet_cidr_block_backend_db_1[terraform.workspace]
    vpc_subnet_cidr_block_frontend_web_2 = var.vpc_subnet_cidr_block_frontend_web_2[terraform.workspace]
    vpc_subnet_cidr_block_backend_db_2 = var.vpc_subnet_cidr_block_backend_db_2[terraform.workspace]
}

module "EC2" {
    source = "./modules/EC2"
    ec2_instance_web_ami = var.ec2_instance_web_ami[terraform.workspace]
    ec2_intance_web_name = var.ec2_intance_web_name[terraform.workspace]
    ec2_instance_web_quantity = var.ec2_instance_web_quantity[terraform.workspace]
    ec2_instance_web_subnet_id = module.VPC.ec2_subnet_frontend_web_1_id
    ec2_instance_web_type = var.ec2_instance_web_type[terraform.workspace]
    ec2_keypair = var.aws_keypair[terraform.workspace]
    vpc_id = module.VPC.vpc_id
    ec2_instance_web_user_data = var.ec2_instance_web_user_data[terraform.workspace]
}



# resource "aws_vpc" "VPCItmVSCodeLab1" {
#     cidr_block = var.vpc_cidr_block
#     instance_tenancy = "default"
#     enable_dns_support = true
#     enable_dns_hostnames = true
#     tags = {
#         Name = "VPC-ItmVSCodeLab1"
#     }
# }

# ############# Subnets #############
# resource "aws_subnet" "SUNNET_ItmVSCodeLab_Frontend_Web_1" {
#     vpc_id            = aws_vpc.VPCItmVSCodeLab1.id
#     cidr_block        = var.vpc_subnet_cidr_block_frontend_web_1
#     availability_zone = "us-east-1a"
#     map_public_ip_on_launch = true
#     depends_on = [ 
#         aws_vpc.VPCItmVSCodeLab1
#     ]
#     tags = {
#         Name = "SUBNET-ItmVSCodeLab1_Frontend_Web_1"
#     }  
# }

# resource "aws_subnet" "SUNNET_ItmVSCodeLab_Frontend_Web_2" {
#     vpc_id            = aws_vpc.VPCItmVSCodeLab1.id
#     cidr_block        = var.vpc_subnet_cidr_block_frontend_web_2
#     availability_zone = "us-east-1b"
#     map_public_ip_on_launch = true
#     depends_on = [ 
#         aws_vpc.VPCItmVSCodeLab1
#     ]
#     tags = {
#         Name = "SUBNET-ItmVSCodeLab1_Frontend_Web_2"
#     }  
# }

# resource "aws_subnet" "SUNNET_ItmVSCodeLab1_Backend_DB_1" {
#     vpc_id            = aws_vpc.VPCItmVSCodeLab1.id
#     cidr_block        = var.vpc_subnet_cidr_block_backend_db_1
#     availability_zone = "us-east-1a"
#     map_public_ip_on_launch = true
#     depends_on = [ 
#         aws_vpc.VPCItmVSCodeLab1
#     ]
#     tags = {
#         Name = "SUBNET-ItmVSCodeLab1_Backend_DB_1"
#     }  
# }

# resource "aws_subnet" "SUNNET_ItmVSCodeLab1_Backend_DB_2" {
#     vpc_id            = aws_vpc.VPCItmVSCodeLab1.id
#     cidr_block        = var.vpc_subnet_cidr_block_backend_db_2
#     availability_zone = "us-east-1b"
#     map_public_ip_on_launch = true
#     depends_on = [ 
#         aws_vpc.VPCItmVSCodeLab1
#     ]
#     tags = {
#         Name = "SUBNET-ItmVSCodeLab1_Backend_DB_2"
#     }  
# }
# ############# Subnets #############

# ############# Internet Gateway #############
# resource "aws_internet_gateway" "IGWItmVSCodeLab1" {
#     vpc_id = aws_vpc.VPCItmVSCodeLab1.id
#     tags = {
#         Name = "IGW-ItmVSCodeLab1"
#     }    
# }

# ############# Internet Gateway #############

# ############# Route Table 1 #############
# resource "aws_route_table" "RTItmVSCodeLab1_Frontend_1" {
#     vpc_id = aws_vpc.VPCItmVSCodeLab1.id
#         route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.IGWItmVSCodeLab1.id
#     }
#     tags = {
#         Name = "RT-ItmVSCodeLab1_Frontend_1"
#     }
#     depends_on = [
#         aws_internet_gateway.IGWItmVSCodeLab1
#     ]
# }

# resource "aws_route_table_association" "RTAItmVSCodeLab1_Frontend_Web_1" {
#     subnet_id      = aws_subnet.SUNNET_ItmVSCodeLab_Frontend_Web_1.id
#     route_table_id = aws_route_table.RTItmVSCodeLab1_Frontend_1.id
# }
# ############# Route Table 1 #############

# ############# Route Table 2 #############
# resource "aws_route_table" "RTItmVSCodeLab1_Backend_DB_1" {
#     vpc_id = aws_vpc.VPCItmVSCodeLab1.id
#         route {
#         cidr_block = "0.0.0.0/0"
#         gateway_id = aws_internet_gateway.IGWItmVSCodeLab1.id
#     }
#     tags = {
#         Name = "RT-ItmVSCodeLab_Backend_DB_1"
#     }
#     depends_on = [
#         aws_internet_gateway.IGWItmVSCodeLab1
#     ]
# }

# resource "aws_route_table_association" "RTAItmVSCodeLab1_Backend_DB_1" {
#     subnet_id      = aws_subnet.SUNNET_ItmVSCodeLab1_Backend_DB_1.id
#     route_table_id = aws_route_table.RTItmVSCodeLab1_Backend_DB_1.id
# }
# ############# Route Table 2 #############

# ############# Network Access Control List #############
# resource "aws_network_acl" "NACLItmVSCodeLab1_Frontend" {
#     vpc_id = aws_vpc.VPCItmVSCodeLab1.id
#     subnet_ids = [
#         aws_subnet.SUNNET_ItmVSCodeLab_Frontend_Web_1.id,
#         aws_subnet.SUNNET_ItmVSCodeLab_Frontend_Web_2.id
#     ]

#     ingress {
#         protocol   = "all"
#         rule_no    = 100
#         action     = "allow"
#         cidr_block = var.vpc_cidr_block
#         from_port  = 0
#         to_port    = 0
#     }
    
#     ingress {
#         protocol   = "tcp"
#         rule_no    = 200
#         action     = "allow"
#         cidr_block = "0.0.0.0/0"
#         from_port  = 443
#         to_port    = 443
#     }

#     egress {
#         protocol   = "all"
#         rule_no    = 100
#         action     = "allow"
#         cidr_block = var.vpc_cidr_block
#         from_port  = 0
#         to_port    = 0
#     }

#     egress {
#         protocol   = "tcp"
#         rule_no    = 200
#         action     = "allow"
#         cidr_block = "0.0.0.0/0"
#         from_port  = 1025
#         to_port    = 65535
#     }

#     tags = {
#         Name = "NACL-ItmVSCodeLab1_Frontend"
#     }
# }

# resource "aws_network_acl" "NACLItmVSCodeLab1_Backend" {
#     vpc_id = aws_vpc.VPCItmVSCodeLab1.id
#     subnet_ids = [
#         aws_subnet.SUNNET_ItmVSCodeLab1_Backend_DB_1.id,
#         aws_subnet.SUNNET_ItmVSCodeLab1_Backend_DB_2.id
#     ]

#     ingress {
#         protocol   = "tcp"
#         rule_no    = 100
#         action     = "allow"
#         cidr_block = var.vpc_subnet_cidr_block_backend_db_2
#         from_port  = 5432
#         to_port    = 5432
#     }
    
#     ingress {
#         protocol   = "tcp"
#         rule_no    = 200
#         action     = "allow"
#         cidr_block = var.vpc_subnet_cidr_block_backend_db_2
#         from_port  = 5432
#         to_port    = 5432
#     }

#     egress {
#         protocol   = "all"
#         rule_no    = 100
#         action     = "allow"
#         cidr_block = var.vpc_cidr_block
#         from_port  = 0
#         to_port    = 0
#     }

#     tags = {
#         Name = "NACL-ItmVSCodeLab1_Backend"
#     }
# }

# ############# Network Access Control List #############