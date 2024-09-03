# `vpc` module
A minimal IPv4 VPC solution

## Usage
This module captures (perhaps) the most common basic networking pattern for AWS VPCs.  No attempt is made to provide a network address schema of any kind.

Module callers must define the following variables:

- `availability_zones` - a list of the availability zones that VPC resources will be created in
- `cidr_block` - the network address for the entire VPC
- `label` - a string that is used to name resources in AWS
- `subnets.private` - a list of private subnet addresses inside the VPC's network address
- `subnets.public` - a list of public subnet addresses inside the VPC's network address

The number of public subnets, private subnets, and availabiity zones must be the same.  There is no requirement that you order them in a sane, sequential fashion, but your network topology (and your Terraform state) will be much easier to interpret if you do so.

By default, it is assumed that module callers are cost-conscious, and so only one NAT gateway will be created (in the first provided public subnet).  For a robust multi-AZ topology, set `var.redundant_nat_gateways` to `true`, and a NAT gateway will be created in every availability zone.

### Outputs
- `availability_zones` - a list of availability zones in which VPC resources are created
- `cidr_block` - the VPC network address
- `id` - the VPC ID
- `nat_gateways` - a map of availability zones to NAT gateways
- `route_table_ids.private` - a map of availability zones to route table IDs with NAT gateway routes
- `route_table_ids.public` - the route table ID with an Internet gateway route, with which all public subnets are associated
- `subnets.private` - a map of availability zones to private subnet IDs
- `subnets.public` - a map of availability zones to public subnet IDs

