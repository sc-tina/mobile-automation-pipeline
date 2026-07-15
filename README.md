# Mobile Automation Pipeline

CI/CD pipeline templates for Android apps. GitHub Actions workflows, Jenkins pipelines, and build/test scripts.

## Contents
- pipelines/github-actions.yml - Android CI workflow
- pipelines/jenkinsfile - Jenkins pipeline
- scripts/build.sh - APK build
- scripts/test_appium.sh - Appium test runner
- scripts/sign.sh - APK signing
- templates/app_config.py - Configuration template

## Pipeline Stages
1. Lint - Static code analysis
2. Unit Test - JVM unit tests
3. Build APK - Debug/release assembly
4. Instrumentation Test - Emulator tests
5. Archive - APK and results storage

## Contact
- Website: https://www.qtphone.com/
