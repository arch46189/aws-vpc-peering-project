# Routing and Security Rules

**Project:** AWS VPC Peering
**Author:** Archita Saxena
**Status:** Planned — pending AWS implementation

## 1. Route Tables

### ewb-rt-a-public
| Destination | Target |
|---|---|
| 10.10.0.0/16 | local |
| 0.0.0.0/0 | ewb-igw-a |
| 10.20.0.0/16 | VPC peering connection |

### ewb-rt-a-private
| Destination | Target |
|---|---|
| 10.10.0.0/16 | local |
| 10.20.0.0/16 | VPC peering connection |

### ewb-rt-b-private
| Destination | Target |
|---|---|
| 10.20.0.0/16 | local |
| 10.10.0.0/16 | VPC peering connection |

The peering routes will be added after the connection becomes Active.

## 2. Security Groups

### ewb-sg-bastion
- Inbound SSH TCP 22 from the administrator's current public IPv4 /32.

### ewb-sg-app-a
- Inbound SSH TCP 22 from 10.10.1.10/32.
- Inbound ICMP Echo requests from 10.20.1.10/32.

### ewb-sg-app-b
- Inbound SSH TCP 22 from 10.10.1.10/32.
- Inbound ICMP Echo requests from 10.10.2.10/32.

Keep the default outbound allow-all rule for this beginner lab.
Use the default network ACLs.

## 3. Security Notes

- Never expose SSH to 0.0.0.0/0.
- Application servers must not have public IPv4 addresses.
- Use the correct private IP addresses as security group sources.
- Update /32 rules if a lab instance's IP changes.
- Never commit private keys, credentials or access tokens.

## 4. Verification

Record actual security group IDs and inbound rules after deployment.
Capture screenshots showing the final rules.
