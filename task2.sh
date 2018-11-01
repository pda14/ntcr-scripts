#!/bin/bash
#
# List gigabit interfaces names from file.

ifaces=()

while read line; do
    if=$(echo "$line" | sed -r "s/.*STRING:\ //g")
    ifaces+=("$if")
done < interfaces.txt

for element in "${ifaces[@]}"; do
    echo "$element" | grep Gi
done
