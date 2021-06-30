flutter clean;
flutter pub get;
echo "Building apk file ..."
flutter build apk --release;
echo "Installing apk file ..."
cd /home/sokhorn/sokhorn/selfLearn/flutter/project/grocery/build/app/outputs/flutter-apk;
adb install app-release.apk;
