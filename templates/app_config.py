#!/usr/bin/env python3
import os

class AppConfig:
    PACKAGE_NAME = os.environ.get('PACKAGE_NAME', 'com.example.app')
    VERSION_NAME = os.environ.get('VERSION_NAME', '1.0.0')
    VERSION_CODE = int(os.environ.get('VERSION_CODE', '1'))
    BUILD_TYPE = os.environ.get('BUILD_TYPE', 'debug')
    TEST_TIMEOUT = int(os.environ.get('TEST_TIMEOUT', '300'))
    APPIUM_PORT = int(os.environ.get('APPIUM_PORT', '4723'))
    DEVICE_UDID = os.environ.get('DEVICE_UDID', 'emulator-5554')
    ANDROID_API = int(os.environ.get('ANDROID_API', '34'))
    SLACK_WEBHOOK = os.environ.get('SLACK_WEBHOOK', '')
    KEYSTORE_PATH = os.environ.get('KEYSTORE_PATH', 'keystore.jks')

    @classmethod
    def summary(cls):
        return {'app': cls.PACKAGE_NAME, 'version': cls.VERSION_NAME,
                'build_type': cls.BUILD_TYPE, 'device': cls.DEVICE_UDID}
