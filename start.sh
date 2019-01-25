#!/bin/bash
# Enabled this script by removing the above.

export MIX_ENV=prod
export PORT=4790

echo "Stopping old copy of app, if any..."

_build/prod/rel/practice/bin/practice stop || true

echo "Starting app..."

_build/prod/rel/practice/bin/practice start

# Changed "foreground" to "Start"

# Added a cron rule or systemd service file
#       to start your app on system boot.

