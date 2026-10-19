#!/bin/bash
set -u

echo "=== Hostname ==="
hostname

echo
echo "=== Private IP addresses ==="
hostname -I

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <peer-private-ip>"
    exit 1
fi

PEER_IP="$1"

echo
echo "=== Ping test to ${PEER_IP} ==="
ping -c 4 "$PEER_IP"
