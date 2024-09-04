# terraform-aws-vpc

## Overview

This Terraform module creates an AWS VPC with a given CIDR block. It also creates multiple subnets (both public and private), and for public subnets, it sets up an Internet Gateway (IGW) and the appropriate route tables.

## Features

- **Creates a VPC** with a specified CIDR block.
- **Creates public and private subnets** based on user configuration.
- **Creates an Internet Gateway (IGW)** for public subnets.
- **Sets up route tables** for public subnets to route traffic through the IGW.

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