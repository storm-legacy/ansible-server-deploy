#!/usr/bin/env bash
set -exu

CLAMSCAN_BIN="/usr/bin/clamscan"

QUAR_DIR="/var/quarantine/clamav"

LOG_DIR="/var/log/clamav"
LOG_FILE="${LOG_DIR}/clamav-$(date +'%Y-%m-%d').log";
LOG_KEEP=14

mkdir -p "$LOG_DIR" "$QUAR_DIR"
chmod 700 "$QUAR_DIR"

# rotate logs
ls -1t "$LOG_DIR"/*.log 2>/dev/null | tail -n +$((LOG_KEEP+1)) | xargs -r rm -f

# scan
$CLAMSCAN_BIN --exclude='^/dev/' --exclude='^/proc/' --exclude='^/sys/' --exclude='^/run/' --infected --recursive --log="$LOG_FILE" --move="$QUAR_DIR" /
CLAMSCAN_ERR=$?

if [ "$CLAMSCAN_ERR" -eq "1" ]; then
  # TODO: send information about found malware
  :

elif [ "$CLAMSCAN_ERR" -gt "1" ]; then
  # TODO: send information about scan error
  :

fi