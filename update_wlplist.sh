#!/bin/sh

wlproject="$PWD/wlproject"
wlplist="$wlproject/apps/wlnativeios/worklight.plist"

if [ -f $wlplist ]; then

    if [ "$CONFIGURATION" = "Debug" ]; then

        host=`ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'`
        port="10080"

    else

        host="worklight.acme.com"
        port="80"

    fi

    echo "Setting Worklight Host to $host on $wlplist"
    /usr/libexec/PlistBuddy -c "Set host $host" "$wlplist"
    echo "Setting Worklight Port to $port on $wlplist"
    /usr/libexec/PlistBuddy -c "Set port $port" "$wlplist"

fi