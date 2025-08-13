#!/bin/sh

echo "$(date): Weekly reboot initiated." >> /var/log/weekly_reboot.log
/sbin/reboot
