#!/bin/bash
set -e
APK_PATH=$1; [ -z "$APK_PATH" ] && { echo "Usage: $0 <apk_path>"; exit 1; }
KEYSTORE=${KEYSTORE:-keystore.jks}; KEY_ALIAS=${KEY_ALIAS:-mykey}
STOREPASS=${STOREPASS:-changeit}; KEYPASS=${KEYPASS:-$STOREPASS}
[ ! -f "$APK_PATH" ] && { echo "APK not found"; exit 1; }
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -v -keystore "$KEYSTORE" -alias "$KEY_ALIAS" -keyalg RSA -keysize 2048 -validity 10000         -storepass "$STOREPASS" -keypass "$KEYPASS" -dname "CN=Dev, OU=Mobile, O=Company, L=City, ST=State, C=US"
fi
BASENAME=$(basename "$APK_PATH" .apk); DIR=$(dirname "$APK_PATH")
SIGNED="$DIR/${BASENAME}-signed.apk"
apksigner sign --ks "$KEYSTORE" --ks-key-alias "$KEY_ALIAS" --ks-pass pass:"$STOREPASS" --key-pass pass:"$KEYPASS" --out "$SIGNED" "$APK_PATH"
zipalign -f -v 4 "$SIGNED" "$DIR/${BASENAME}-aligned.apk" 2>/dev/null || cp "$SIGNED" "$DIR/${BASENAME}-aligned.apk"
apksigner verify "$DIR/${BASENAME}-aligned.apk" && echo "Signature valid!"
