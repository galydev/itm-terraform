
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "vpc_subnet_cidr_block_frontend_web_1" {
  description = "The CIDR block for the subnet Frontend/Web"
  type        = string
}
variable "vpc_subnet_cidr_block_backend_db_1" {
  description = "The CIDR block for the subnet Backend/Database"
  type        = string
}
variable "vpc_subnet_cidr_block_frontend_web_2" {
  description = "The CIDR block for the subnet Frontend/Web 2"
  type        = string
}
variable "vpc_subnet_cidr_block_backend_db_2" {
  description = "The CIDR block for the subnet Backend/Database 2"
  type        = string
}

