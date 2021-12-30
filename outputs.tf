# VPC OUTPUTS
output "vpc_self_link" {
  value = module.dev_vpc.vpc_self_link
}

# SUBNET OUTPUTS
output "bastion_subnet_self_link" {
  value = module.dev_vpc.bastion_subnet_self_link
}

output "public_subnet_self_link" {
  value = module.dev_vpc.public_subnet_self_link
}

output "private_subnet_self_link" {
  value = module.dev_vpc.private_subnet_self_link
}

# NAT OUTPUTS
output "public_nat_ip_1" {
  value = module.dev_vpc.public_nat_ip_1
}

output "public_nat_ip_2" {
  value = module.dev_vpc.public_nat_ip_2
}