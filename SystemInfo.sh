#!/bin/bash
FILE="system_info_.txt"
{ 
echo "Number of Running Processes Excluding The Threads: ";
ps -A --no-headers | wc -l;
echo -e;
echo "Number of Running Processes Including The Threads: ";
ps -AL --no-headers | wc -l;
echo -e;
echo "Linux kernel Release: ";
uname -r;
echo -e;
echo "Processor Type: ";
lscpu | grep "Model name" | awk '{ $1=$2="";$0=$0;} NF=NF'
echo -e;
echo "Processor Description: ";
lscpu | grep -E '^Arch|^Thread|^Core|^Socket|^CPU|^L'
echo -e;
echo "Available Disk Space: ";
df -H | grep -E '^/dev' | awk '{ print $4 " " $1}';
echo -e;
echo "Used Disk Space In Percentage: ";
df -H | grep -E '^/dev' | awk '{ print $5 " " $1 }'
echo -e;
echo "Mac Address For The System: ";
ip link | awk '/ether/ {print $2}'
} > $FILE