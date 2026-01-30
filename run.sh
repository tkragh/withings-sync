#!/bin/sh

STATUS_FILE=/config/status.txt
LOG_FILE=/config/withings-sync.log

echo "Starter sync: $(date)" >> "$LOG_FILE"

withings-sync \
  --gu "$GARMIN_USER" \
  --gp "$GARMIN_PASS" \
  --features BLOOD_PRESSURE >> "$LOG_FILE" 2>&1

RC=$?

if [ "$RC" -eq 0 ]; then
  echo "OK $(date)" > "$STATUS_FILE"
  echo "Sync OK" >> "$LOG_FILE"
else
  echo "FEJL $(date) RC=$RC" > "$STATUS_FILE"
  echo "Sync FEJL (RC=$RC)" >> "$LOG_FILE"
fi
