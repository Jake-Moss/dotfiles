#!/bin/bash
light -A 5
dunstify --replace=1 --icon="/usr/share/icons/Papirus-Dark/symbolic/status/display-brightness-medium-symbolic.svg" "Brightness" "$(light -G)"
