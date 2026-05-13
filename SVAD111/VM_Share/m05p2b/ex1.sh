#!/bin/bash

echo "System Hostname:"
hostname
echo ""

echo "Current System Date/Time:"
date
echo ""

echo "Current System Uptime:"
uptime -p
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "File System Usage:"
df -h
echo ""

echo "Network Address Information:"
ip a
