# Terraform VPC Module

This Terraform module allows users to create an AWS Virtual Private Cloud (VPC) with multiple subnets. Users can specify the CIDR block for the VPC, define subnets, choose their availability zones, and determine whether a subnet is public or private. If any public subnets are created, the module will automatically create an Internet Gateway (IGW) and associate the public subnets with a routing table.

## Features

- **VPC Creation**: Create a VPC with a user-specified CIDR block.
- **Multiple Subnets**: Users can create multiple subnets with custom CIDR blocks.
- **Availability Zone Selection**: Users can specify the availability zone for each subnet.
- **Public/Private Subnets**: Users can designate subnets as public (default is private).
- **Automatic IGW Creation**: If public subnets are created, the module will automatically create an Internet Gateway.
- **Routing Table Association**: Public subnets are automatically associated with a routing table that routes traffic through the Internet Gateway.

## Workflow Diagram

```plaintext
+---------------------------+
|        Start               |
+---------------------------+
            |
            v
+---------------------------+
| Input VPC CIDR Block       |
| (User provides CIDR block) |
+---------------------------+
            |
            v
+---------------------------+
|       Create VPC           |
| (Using the CIDR block)     |
+---------------------------+
            |
            v
+-----------------------------------+
|  For Each Subnet Configuration    |
|  (Loop over user-provided subnets)|
+-----------------------------------+
            |
            v
+-----------------------------------+
| Input Subnet CIDR Block,          |
| Availability Zone, and            |
| Public/Private Flag               |
+-----------------------------------+
            |
            v
+---------------------------+
|       Create Subnet        |
| (With provided CIDR block, |
| Availability Zone, and Flag)|
+---------------------------+
            |
            v
+---------------------------+
| Is Subnet Public?         |
| (Decision Point)          |
+---------------------------+
       |         |
       |         v
       |     +---------------------------+
       |     | No: Add to Private Subnets |
       |     +---------------------------+
       |
       v
+-----------------------------------+
| Yes: Add to Public Subnets List   |
+-----------------------------------+
            |
            v
+---------------------------+
| Check if Any Public Subnets|
| Exist (Decision Point)     |
+---------------------------+
       |         |
       |         v
       |     +---------------------------+
       |     | No: Skip IGW and           |
       |     | Route Table Creation       |
       |     +---------------------------+
       |
       v
+-------------------------------+
| Yes: Create Internet Gateway  |
| (IGW for VPC)                 |
+-------------------------------+
            |
            v
+-------------------------------+
| Create Route Table            |
| (For public subnets)          |
+-------------------------------+
            |
            v
+-------------------------------+
| Associate Route Table with    |
| Public Subnets                |
+-------------------------------+
            |
            v
+---------------------------+
|          End              |
+---------------------------+
