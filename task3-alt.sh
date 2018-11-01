#!/bin/bash
#
# List not used accounts. Alternative less mindblowing(atleast for me:)) version.
 
for acc in $(sed -r "s/:.*//g" all_accs.txt); do
    grep -q "$acc" used_accs.txt || echo "$acc"
done
