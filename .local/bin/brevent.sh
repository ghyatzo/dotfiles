#!/bin/sh

wd="$HOME/.local/bin/platform-tools/"
adb="$wd/adb"

$adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh && \
$adb -d shell sh /sdcard/Android/data/moe.shizuku.privileged.api/files/start.sh

unset wd
unset adb
