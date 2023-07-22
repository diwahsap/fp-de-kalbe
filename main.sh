#!/bin/bash

# Variables
path="/hdfs/data/data1"
name_of_directory="data1"

# Check if the directory exists
if [ -d "$path/$name_of_directory" ]; then
    echo "There is $name_of_directory Directory Exists!"
else
    echo "$name_of_directory Directory Not Exists!"
    # Create the directory inside the path
    mkdir -p "$path/$name_of_directory"
fi

# Create the script file and give it executable permissions
# chmod +x main.sh

# To schedule the script to run daily at 07:00 AM, add a crontab entry
# Open the crontab editor using the command: crontab -e
# Add the following line to the crontab file (replace /path/to/script with the actual path to your script file):
# 0 7 * * * /path/to/script/check_and_create_directory.sh

# Save the crontab file and exit the editor.