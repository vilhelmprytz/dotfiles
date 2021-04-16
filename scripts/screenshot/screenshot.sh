#!/bin/bash

# import .env
source .env

YEAR=$(date +"%Y")
MONTH=$(date +"%m")

# create month
mkdir -p "$GIT_PATH/$YEAR/$MONTH"

# new screenshot
FILENAME=$(date +"%Y-%m-%d_%H-%M-%S.png")

sleep 1s
gnome-screenshot  -a -f "$GIT_PATH/$YEAR/$MONTH/$FILENAME"

# git stuff
CURRENT_PATH=$(pwd)

cd "$GIT_PATH" || exit 1
git add .
git commit -m "$YEAR/$MONTH: $FILENAME"

# rsync -avh "$GIT_PATH"/ "$SSH_USER"@"$SSH_HOST":"$REMOTE_PATH" --delete
git push deploy master

cd "$CURRENT_PATH" || exit 1

# copy to clipboard
echo "$PUBLIC_URL/$YEAR/$MONTH/$FILENAME" | xclip -selection c
