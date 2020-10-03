#!/bin/sh

wd="$HOME/.local/bin/platform-tools/"
adb="$wd/adb"

$adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh && \
$adb shell sh /data/user_de/0/moe.shizuku.privileged.api/start.sh

unset wd
unset adb
