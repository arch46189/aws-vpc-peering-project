# AWS VPC Peering — Architecture

## 1. Objective

Connect two non-overlapping AWS VPCs using VPC peering and prove
private IPv4 connectivity between their application servers.

## 2. Planned Components

### VPC A
- CIDR: 10.10.0.0/16
- Public subnet: 10.10.1.0/24
- Private subnet: 10.10.2.0/24
- Internet gateway: ewb-igw-a
- Bastion: ewb-bastion
- Application server: ewb-app-a

### VPC B
- CIDR: 10.20.0.0/16
- Private subnet: 10.20.1.0/24
- Application server: ewb-app-b
- No internet gateway

### VPC Peering
- Name: ewb-a-b-peer
- Connects VPC A and VPC B
- Must reach Active status before route validation

## 3. Traffic Paths

### Administrative access

Laptop -> Internet -> Bastion -> App-A or App-B

SSH access to the bastion will be restricted to the administrator's
current public IPv4 address.

Private application servers will accept SSH from the bastion's
private IP address.

### Application connectivity

App-A -> VPC A private route table -> VPC peering -> VPC B private
route table -> App-B

The return path requires a corresponding route from VPC B to VPC A.

## 4. Security Principles

- No public IPv4 addresses on App-A or App-B.
- Restrict SSH to required source addresses.
- Allow ICMP Echo requests only from the intended peer application.
- Use the default network ACLs for this lab.
- Never commit private keys or AWS credentials.

## 5. Validation

The implementation must demonstrate:
1. Failed baseline connectivity before peering routes.
2. Successful forward and reverse private connectivity.
3. SSH access to App-B through the bastion.
4. Failed ping after temporarily removing the relevant ICMP rule.
5. Successful ping after restoring the rule.

## 6. Deployment Status

This is the planned architecture. Actual resource IDs, screenshots
and test results will be recorded after AWS deployment.
