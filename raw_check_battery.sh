#!/bin/bash
# battery checker by Jim Bachmann

export DISPLAY=:0
export XAUTHORITY=/home/USERNAME/.Xauthority
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/USERID/bus"

LOCKFILE="/tmp/battery_warning.lock"

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

if [ "$battery_level" -le 15 ]; then
    # If lockfile exists, do nothing
    if [ -f "$LOCKFILE" ]; then
        exit 0
    fi

    # Create the lockfile
    touch "$LOCKFILE"

    # Show warning
    #uxterm -e "echo 'Battery low (${battery_level}%)!' && echo 'Press Enter to close.' && read line"

    zenity --warning --text="Battery low (${battery_level}%)!"

    # Remove the lock when the window closes
    rm -f "$LOCKFILE"
else
    # Remove the lock if battery has recovered
    rm -f "$LOCKFILE"
fi 
