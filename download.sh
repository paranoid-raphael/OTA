#!/bin/bash

# Make the $TMP_DIR folder and change to it
mkdir $TMP_DIR
cd $TMP_DIR

# Download the Build
if [[ $DOWNLOAD_LINK == *"drive.google.com"* ]]; then
    pip install gdown

    if [[ $DOWNLOAD_LINK == *"file"* ]]; then
        DOWNLOAD_LINK=$(echo $DOWNLOAD_LINK | cut -d / -f 6)
    elif [[ $DOWNLOAD_LINK == *"id"* ]]; then
        DOWNLOAD_LINK1=$(echo $DOWNLOAD_LINK | cut -d = -f 2 | cut -d '&' -f 1)
        DOWNLOAD_LINK2=$(echo $DOWNLOAD_LINK | cut -d = -f 4)
    fi
    gdown https://drive.google.com/uc?id=$DOWNLOAD_LINK1 || gdown https://drive.google.com/uc?id=$DOWNLOAD_LINK2
else
    aria2c -c -m0 -x16 -s50 $DOWNLOAD_LINK
fi

# Change back to the Old Directory
cd -

# Exit
exit 0
