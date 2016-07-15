#!/bin/bash

sig=$(grep wlp2s0b1 /proc/net/wireless | awk '{ print int($3 * 100 / 70) }')

echo "<span> $sig%</span>"
#echo "<span underline_color=\"#6c71c4\" underline=\"double\"> $sig%</span>"
