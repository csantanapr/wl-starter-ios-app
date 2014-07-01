#!/bin/sh

wlproject="$PWD/wlproject"
wl="/Applications/IBM/Worklight-CLI/wl"

if [ -d $wlproject ]; then

    if [ $CONFIGURATION = "Debug" ]; then

        pushd $wlproject
        $wl status

        if [ $? -ne 0 ]; then

            echo "Worklight Server is not running"
            echo "Lets start Worklight Server"
            $wl start

        else

            echo "Worklight Server is already running"

        fi
        popd
    fi
fi