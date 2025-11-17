#!/bin/bash
echo "Installing the lxde-battery checker made by Jim Bachmann"

echo "Installing prerequisites"
sudo apt-get install acpi zenity

sed "s/USERNAME/$USER/g; s/USERID/$(id -u)/g" raw_check_battery.sh > check_battery.sh


sudo mkdir /root/bin
sudo chmod 700 /root/bin
sudo cp check_battery.sh /root/bin
sudo chmod 700 /root/bin/check_battery.sh
sudo chmod +x /root/bin/check_battery.sh

( sudo crontab -l 2>/dev/null | grep -Fxq "*/2 * * * * /root/bin/check_battery.sh" ) || \
( sudo crontab -l 2>/dev/null; echo "*/2 * * * * /root/bin/check_battery.sh" ) | sudo crontab -

