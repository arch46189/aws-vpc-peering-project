# Troubleshooting Guide

## Bastion SSH times out
- Verify the bastion's current public IPv4 address.
- Check the SSH inbound source /32.
- Verify the public subnet association and internet gateway route.
- Confirm the instance is running.

## App-A SSH fails
- Verify the private IP address and key pair.
- Confirm SSH TCP 22 allows 10.10.1.10/32.
- Use the Amazon Linux username ec2-user.

## App-B SSH fails
- Verify the bastion public route table has a route to 10.20.0.0/16
  targeting the peering connection.
- Confirm VPC B has the return route to 10.10.0.0/16.
- Confirm App-B allows SSH from 10.10.1.10/32.

## Ping fails after peering
- Confirm the peering connection is Active.
- Check forward and return routes.
- Verify the destination security group's ICMP Echo rule.
- Confirm the actual private IP addresses.

## Peering cannot be created
- Check that the VPC CIDR ranges do not overlap.
- Check the VPC IDs, account and Region.

## Important
Record the actual error and the fix. Do not claim a test passed
until it has been executed and its output has been saved.
