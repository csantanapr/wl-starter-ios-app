#!/bin/sh

wlproject="$PWD/wlproject"
wladapters="$wlproject/adapters"
wl="/Applications/IBM/Worklight-CLI/wl"

if [ -d $wlproject ]; then

    if [ $CONFIGURATION = "Debug" ]; then

        pushd $wladapters
        $wl build
        $wl deploy
        popd
        
    fi
fi