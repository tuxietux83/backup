#!/usr/bin/bash
# Check if command has an output greater than 0 a do things

if [ "$(ls | wc -l)" -gt 0 ]; then
   echo "merge"
else
   echo "nu merge"
fi
