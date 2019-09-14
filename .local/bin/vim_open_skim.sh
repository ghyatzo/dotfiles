#!/bin/bash

file="$1"
[ "${file:0:1}" == "/" ] || file=${PWD}/${file}

exec osascript << EOF
  tell application "Skim"
  activate
  open POSIX file "${file}"
  end tell
EOF
