#!/bin/bash
# Get today's date in the format expected in the file names
today=$(date -u +'%Y-%m-%d')
#tomorrow=$(date -u -d 'tomorrow' +'%Y-%m-%d')
yesterday=$(date -u -d 'yesterday' +'%Y-%m-%d')
# Get the list of files with today's date from AWS S3 and save it into a variable
files_with_today=$(aws s3 ls "s3://examplebucket/" | grep "$yesterday" | awk '{print $4}')

if [[ -n "$files_with_today" ]]; then

    # Send an email containing the file name to itops@example.com
    echo "Backup file for "$today" ($files_with_today) found in S3 bucket gitlabsofmen." | mailx -s "Backup Found on S3" abc@gmail.com 123abc@gmail.com
else
    echo "Backup file for today not found in S3 bukcet."
fi
