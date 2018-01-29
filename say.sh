#!/bin/bash
# Read selected text

# Parse sapi5 voice name when calling this script
# Ex: sh say.sh 'yome voice name'
voice_name=$1

# Set your wine prefix location if necessary
location=~/.PlayOnLinux/wineprefix/tts

# Copy selected text using xclip
xclip -out -selection primary | xclip -in -selection clipboard
cd $location/drive_c/balcon/
# Convert selected text from utf-8 to utf-16 windows format and save it to file
xclip -o | iconv --from-code=utf-8 --to-code=utf-16 --output=selected_text.txt
# Read text from file
WINEPREFIX=$location wine c:/balcon/balcon -n $voice_name -f c:/balcon/selected_text.txt
