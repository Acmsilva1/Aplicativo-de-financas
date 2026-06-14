# APK Release Checklist

Use this folder for the direct APK distribution path.

## Target

- Installable Android app for sideloading
- Web content can still come from the Vercel deployment
- No dependency on Play Console

## Build inputs

- Android Studio
- JDK
- Android SDK
- Signed release keystore

## Suggested package layout

```text
apk app/
|-- android-app/
|   |-- settings.gradle.kts
|   |-- build.gradle.kts
|   |-- app/
|       |-- build.gradle.kts
|       |-- src/main/AndroidManifest.xml
|       |-- src/main/java/com/minhasfinancas/apk/MainActivity.kt
|       |-- src/main/res/values/strings.xml
|       |-- src/main/res/values/themes.xml
|-- release-checklist.md
|-- release-notes.md
|-- README.md
```

## Future release steps

1. Open the Android project in Android Studio.
2. Wire the app to the production URL.
3. Build a signed APK.
4. Test install on a real device.
5. Store the signed artifact in this folder.

