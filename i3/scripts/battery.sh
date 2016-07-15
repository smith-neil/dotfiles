#!/bin/bash

is_charging=$(acpi | awk '{print $3}' | sed 's/,//g')
amount=$(acpi | awk '{print $4}' | sed 's/[%|,]//g')
time_left=$(acpi | awk '{print $5}' | cut -c 1-5)

result=""

if [ "$is_charging" == "Charging" ]; then
    result=""
elif [ "$is_charging" == "Full" ]; then
    result=""
else
    if [ "$amount" -ge 66 ]; then
        result=""
    elif [ "$amount" -ge 33 ]; then
        result=""
    else
        result=""
    fi
fi

result+=" $amount%"

if [ "$is_charging" == "Discharging" ]; then
    result+=" ($time_left)"
fi

echo "<span>$result</span>"
