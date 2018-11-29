#!/bin/bash
FILE="system_info_.txt"
{ 
echo "Number of running processes excluding the threads: ";
ps -A --no-headers | wc -l;
echo -e;
echo "Number of running processes including the threads: ";
ps -AL --no-headers | wc -l;
echo -e;
echo "Linux kernel release: ";
uname -r;
echo -e;
echo "Available Disk Space: ";
df -H | grep -E '^/dev' | awk '{ print $4 " " $1 }';
} > $FILE