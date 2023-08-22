#!/bin/bash
# Lerie Taylor 2023
# scarylerie@gmail.com

## get the first device
first_dev=$(adb devices -l |head -n2 |tail -n-1|cut -d' ' -f1)
echo $first_dev
