# Flutter Android Build Fix Plan

## Steps:
- [ ] 1. Update android/app/build.gradle.kts: Set compileSdk = 36 and ndkVersion = "27.0.12077973"
- [x] 2. Run `flutter clean`
- [ ] 3. Run `flutter build apk --release` to test
- [ ] 4. Check android/gradle.properties and reduce `org.gradle.jvmargs` to `-Xmx4G` (and other memory settings like `MaxMetaspaceSize` and `ReservedCodeCacheSize`) if you have less than 16GB RAM.
