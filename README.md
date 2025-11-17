Lightweigh tool to check your Laptop battery.

############ Basic Installtion:

Run "install-lxde-battery-checker.sh" and it will setup the script for you.

Next time your battery drops below 15 percent it will notify you with a little window.

############ Prerequisites:

These are installed automatically: acpi zenity

############ Advanced configuration:

If you want to modify this threshold of 15 percent, go into the raw_check_battery.sh and edit this line:

if [ "$battery_level" -le 15 ]; then

where the "15" equals 15 %, so if you want it to notify you when it is below 10 for example, put a 10 there instead of 15.
