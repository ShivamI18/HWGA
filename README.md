name: Build IPA without Signing

on: [push, pull_request]

jobs:
  build:
    runs-on: macos-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Set up Xcode
        run: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

      - name: Install Dependencies
        run: |
          brew install xcpretty
          sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

      - name: Build the App
        run: |
          xcodebuild clean archive \
            -scheme BackgroundVideoRecorder \
            -archivePath build/BackgroundVideoRecorder.xcarchive \
            -sdk iphoneos \
            -destination "generic/platform=iOS" \
            CODE_SIGNING_ALLOWED=NO | xcpretty

      - name: Export IPA
        run: |
          xcodebuild -exportArchive \
            -archivePath build/BackgroundVideoRecorder.xcarchive \
            -exportOptionsPlist ExportOptions.plist \
            -exportPath build/IPA \
            CODE_SIGNING_ALLOWED=NO | xcpretty

      - name: Upload IPA
        uses: actions/upload-artifact@v4
        with:
          name: BackgroundVideoRecorder.ipa
          path: build/IPA
