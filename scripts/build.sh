#!/bin/bash
set -e
echo "Building Android APK..."
if [ -f gradlew ]; then
    chmod +x gradlew
    ./gradlew clean assembleDebug --stacktrace
    APK=$(find . -name "*.apk" -path "*/outputs/*" | head -1)
    [ -n "$APK" ] && echo "APK: $APK ($(du -h "$APK" | cut -f1))"
else
    echo "gradlew not found"; exit 1
fi
