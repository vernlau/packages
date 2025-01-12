#!/bin/bash

. "$HOME/openwrt-custom/scripts/constfunc.sh"

> "$run_log"

if screen -list | grep -q "\.openwrt"; then
    run run_stop
fi

run run_start

run screen -S openwrt "$scripts/1.sh"
