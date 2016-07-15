#!/bin/bash
mute=`amixer get Master | grep "Mono: Playback" | awk '{print $6}'`
vol=`amixer get Master | grep "Mono: Playback" | awk '{print $4}' | tr -d '[%]'`
if [ "$mute" == "[on]" ]; then
    if [ "$vol" -ge 50 ]; then
        # echo "<span underline_color=\"#d33682\" underline=\"double\"> $vol%</span>"
        echo " $vol%"
    else
        echo " $vol%"
    fi
else
    echo " mute"
fi
