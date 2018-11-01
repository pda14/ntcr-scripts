#!/bin/bash
#
# Check for incorrect addresses.

iplist=(10.10.10.10 0.2.3.4 1.2.3.4 2.1111.5.255 5.6.8 254.254.254.254 1.0.0.2)

# I don't know if 0.2.3.4 are really incorrect, it's still can be included in a valid 0.0.0.0/8 subnet.
# But I decided to follow the idea of original task.
# And yes, i don't know how to break long quoted regex without breaking it's functionality. 
_checkip () {
    grep -Evq "^([1-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){2}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
}

ipcount=
for ip in "${iplist[@]}"; do
    if echo "$ip" | _checkip; then
        ipcount=$(($ipcount+1))
        echo "Not correct IP Address: $ip"
    fi
done

echo "--------------"
echo "Number of incorrect addresses: $ipcount"
