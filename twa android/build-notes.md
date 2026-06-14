# TWA Build Notes

This folder is reserved for the Android Trusted Web Activity path.

## Core idea

- The web app remains hosted on Vercel
- Android only wraps the web app
- Asset links connect the site and the Android package

## Suggested project layout

```text
twa android/
|-- twa-app/
|   |-- settings.gradle.kts
|   |-- build.gradle.kts
|   |-- app/
|       |-- build.gradle.kts
|       |-- src/main/AndroidManifest.xml
|       |-- src/main/java/com/minhasfinancas/twa/LauncherActivity.kt
|       |-- src/main/res/values/strings.xml
|       |-- src/main/res/values/themes.xml
|-- assetlinks.json.example
|-- build-notes.md
|-- README.md
```

## Production requirements

- HTTPS on the Vercel domain
- Hosted `assetlinks.json` on the same domain
- Signed Android release
- Package name kept stable across releases

