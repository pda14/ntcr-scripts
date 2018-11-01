#!/bin/bash
#
# List not used accounts. Initially this script were a simple "for" loop plus grep.
# But I think it's not solution that you were expect from me, so I decided to move original script to task3-alt.sh

notused=()

for acc in $(sed -r "s/:.*//g" all_accs.txt); do
    skip=
    for uacc in $(cat used_accs.txt); do
        [[ "$uacc" == "$acc" ]] && { skip=1; break; }
    done
    [[ "$skip" == 1 ]] || notused+=("$acc")
done

for element in "${notused[@]}"; do
    echo "$element"
done
