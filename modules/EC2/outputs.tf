output "instance_ids" {
  value = aws_instance.ec2_instance_web.*.id
}

output "public_ips" {
  value = aws_instance.ec2_instance_web.*.public_ip
}
