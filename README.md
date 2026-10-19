# AWS VPC Peering Project

**Author:** Archita Saxena  
**Training:** EWB Cloud Labs  
**Project:** AWS VPC Peering  
**Status:** In Progress

## Overview

This project implements AWS VPC Peering to establish private IPv4
connectivity between two Virtual Private Clouds (VPCs).

The design includes two private application servers and one public
bastion host for administrative SSH access.

## Objectives

- Create two VPCs with non-overlapping CIDR ranges.
- Configure public and private subnets and route tables.
- Establish and activate a VPC peering connection.
- Configure forward and return routes.
- Restrict inbound access using security groups.
- Verify private connectivity using ICMP ping.
- Demonstrate a controlled connectivity failure and recovery.
- Document the architecture, tests, and cleanup.

## Planned Architecture

- VPC A: `10.10.0.0/16`
- VPC B: `10.20.0.0/16`
- Public subnet A: `10.10.1.0/24`
- Private subnet A: `10.10.2.0/24`
- Private subnet B: `10.20.1.0/24`
- Bastion host: `10.10.1.10`
- App-A: `10.10.2.10`
- App-B: `10.20.1.10`

App-A and App-B will use private IP addresses to communicate over
the VPC peering connection. Neither application server will have
a public IPv4 address.

## Technology

- Amazon VPC
- Amazon EC2
- VPC Peering
- Route Tables
- Internet Gateway
- Security Groups
- Amazon Linux 2023
- SSH and ICMP
- Git and GitHub

## Repository Structure

- `docs/` — Architecture, IP plan, routing, security, troubleshooting
- `diagrams/` — Architecture diagrams
- `scripts/` — Connectivity test scripts
- `screenshots/` — Genuine project execution evidence
- `report/` — Final project report

## Validation Plan

1. Record the connectivity baseline before peering.
2. Test forward connectivity from App-A to App-B.
3. Test reverse connectivity from App-B to App-A.
4. Verify SSH access to App-B through the bastion.
5. Remove an ICMP rule temporarily and observe the failure.
6. Restore the rule and verify connectivity recovery.
7. Capture actual results and clean up AWS resources.

## Security

Private keys, AWS credentials, passwords, and access tokens must
never be committed to this repository.

## Project Status

The repository and network plan are being prepared. AWS deployment,
test results, resource IDs, screenshots, and the final report will
be added after the corresponding steps are completed.

**Note:** Planned architecture is not evidence of a completed deployment.
