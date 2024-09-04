output "vpc" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC."
}

output "public_subnet" {
  value       = module.vpc.public_subnets
  description = "The IDs of the public subnets created within the VPC."
}

output "private_subnet" {
  value       = module.vpc.private_subnets
  description = "The IDs of the private subnets created within the VPC."
}