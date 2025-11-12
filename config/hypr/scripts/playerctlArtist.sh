#!/usr/bin/env bash

STATUS=$(playerctl status)
PLAYING="Playing"

if [[ "$STATUS" == "$PLAYING" ]]; then
    echo "$(playerctl metadata artist)"
fi
