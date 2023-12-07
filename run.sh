#!/bin/bash
while :
do
    date
    python pt.py
    if [ $? -ne 0 ]; then
        echo "Error occurred while running pt.py"
        exit 1
    fi
    sleep 1d
done