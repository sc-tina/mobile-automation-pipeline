#!/bin/bash
set -e
APPIUM_PORT=${APPIUM_PORT:-4723}
DEVICE_UDID=${DEVICE_UDID:-emulator-5554}
echo "Starting Appium on port $APPIUM_PORT..."
appium --port $APPIUM_PORT --log appium.log &
APPIUM_PID=$!
for i in $(seq 1 20); do
    curl -s http://localhost:$APPIUM_PORT/wd/hub/status > /dev/null 2>&1 && echo "Appium ready" && break
    sleep 2
done
adb -s $DEVICE_UDID wait-for-device
adb -s $DEVICE_UDID shell settings put global window_animation_scale 0.0
adb -s $DEVICE_UDID shell settings put global transition_animation_scale 0.0
adb -s $DEVICE_UDID shell settings put global animator_duration_scale 0.0
# Run tests
if [ -f requirements.txt ]; then pip install -r requirements.txt; python3 -m pytest tests/ -v --junitxml=appium_results.xml; fi
kill $APPIUM_PID 2>/dev/null || true
