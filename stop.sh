#!/bin/bash
# Stop reading text

# Set your wine prefix location if necessary
location=~/.PlayOnLinux/wineprefix/tts

# Stop reading text
WINEPREFIX=$location wine c:/balcon/balcon -k
