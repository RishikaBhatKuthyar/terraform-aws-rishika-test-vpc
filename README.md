# Terraform VPC Module

This Terraform module allows users to create an AWS Virtual Private Cloud (VPC) with multiple subnets. Users can specify the CIDR block for the VPC, define subnets, choose their availability zones, and determine whether a subnet is public or private. If any public subnets are created, the module will automatically create an Internet Gateway (IGW) and associate the public subnets with a routing table.

## Features

- **VPC Creation**: Create a VPC with a user-specified CIDR block.
- **Multiple Subnets**: Users can create multiple subnets with custom CIDR blocks.
- **Availability Zone Selection**: Users can specify the availability zone for each subnet.
- **Public/Private Subnets**: Users can designate subnets as public (default is private).
- **Automatic IGW Creation**: If public subnets are created, the module will automatically create an Internet Gateway.
- **Routing Table Association**: Public subnets are automatically associated with a routing table that routes traffic through the Internet Gateway.

## Usage

```hcl
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc_name"
  }

  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-north-1a"
      # To set the subnet as public, default is private
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-north-1b"
    }
  }
}
```