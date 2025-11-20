output "vpc_id" {
    description = "The ID of the VPC"
    value       = aws_vpc.VPCItmVSCodeLab1.id
}
output "ec2_subnet_frontend_web_1_id" {
    description = "The ID of the Frontend/Web 1 Subnet"
    value       = aws_subnet.SUNNET_ItmVSCodeLab_Frontend_Web_1.id
}
output "ec2_subnet_frontend_web_2_id" {
    description = "The ID of the Frontend/Web 2 Subnet"
    value       = aws_subnet.SUNNET_ItmVSCodeLab_Frontend_Web_2.id
}
output "ec2_subnet_backend_db_1_id" {
    description = "The ID of the Backend/Database 1 Subnet"
    value       = aws_subnet.SUNNET_ItmVSCodeLab1_Backend_DB_1.id
}
output "ec2_subnet_backend_db_2_id" {
    description = "The ID of the Backend/Database 2 Subnet"
    value       = aws_subnet.SUNNET_ItmVSCodeLab1_Backend_DB_2.id
}
