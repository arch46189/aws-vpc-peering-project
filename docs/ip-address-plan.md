# AWS VPC Peering — IP Address Plan

**Project:** EWB AWS VPC Peering  
**Author:** Archita Saxena  
**Status:** Planned — AWS resources not yet created

## 1. VPC and Subnet Allocation

| Resource | Name | IPv4 CIDR |
|---|---|---|
| VPC A | ewb-vpc-a | 10.10.0.0/16 |
| Public subnet A | ewb-a-public | 10.10.1.0/24 |
| Private subnet A | ewb-a-private | 10.10.2.0/24 |
| VPC B | ewb-vpc-b | 10.20.0.0/16 |
| Private subnet B | ewb-b-private | 10.20.1.0/24 |

## 2. EC2 Private Addresses

| Instance | Subnet | Private IPv4 | Public IPv4 |
|---|---|---|---|
| ewb-bastion | ewb-a-public | 10.10.1.10 | Required |
| ewb-app-a | ewb-a-private | 10.10.2.10 | None |
| ewb-app-b | ewb-b-private | 10.20.1.10 | None |

The bastion's public IPv4 address will be recorded after launch.
Application servers must not have public IPv4 addresses.

## 3. CIDR Design

VPC A uses 10.10.0.0/16.
VPC B uses 10.20.0.0/16.

These VPC ranges do not overlap, allowing VPC peering.

Each subnet CIDR is contained within its parent VPC CIDR.

## 4. Planned Route Tables

### ewb-rt-a-public
- 10.10.0.0/16 -> local
- 0.0.0.0/0 -> ewb-igw-a
- 10.20.0.0/16 -> ewb-a-b-peer

### ewb-rt-a-private
- 10.10.0.0/16 -> local
- 10.20.0.0/16 -> ewb-a-b-peer

### ewb-rt-b-private
- 10.20.0.0/16 -> local
- 10.10.0.0/16 -> ewb-a-b-peer

The peering route targets will use the actual peering connection ID.

## 5. Actual Resource Inventory

Complete this section during deployment.

| Resource | Actual AWS ID | Status |
|---|---|---|
| ewb-vpc-a | Pending | Not created |
| ewb-vpc-b | Pending | Not created |
| ewb-a-b-peer | Pending | Not created |
| ewb-bastion | Pending | Not created |
| ewb-app-a | Pending | Not created |
| ewb-app-b | Pending | Not created |

## 6. Important Notes

- Use the same AWS Region for both VPCs.
- Record actual private IP addresses and resource IDs.
- Update this document if the deployed addresses differ from the plan.
- Do not include private keys, credentials or access tokens.
