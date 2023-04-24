# PaperManager_app

---

### 패키지 설치
1. cd 프로젝트 폴더
2. flutter pub get
3. cd ios
4. pod cache clean --all
5. (M1이면) arch -x86_64 pod install --repo-update --clean-install
   (M1이 아니면) pod install --repo-update --clean-install

---

### IOS 빌드 명령어
- flutter run --release

---

### IOS 빌드시 "GoogleService-Info.plist"이 없다고 할 경우
1. IOS 프로젝트 파일을 "XCODE"로 오픈
2. Runner 폴더에서 오른쪽 클릭
3. 활성화된 메뉴에서 Add Files to"Runner" 선택
4. "GoogleService-Info.plist" 파일을 찾아 선택

---

### IOS 빌드 에러시 삭제 대상 폴더 및 파일
1. cd ios
2. pod deintegrate
3. flutter clean
4. rm -rf pubspec.lock
5. rm -rf .flutter-plugins
6. rm -rf .flutter-plugins-dependencies
7. rm -rf ios/.symlinks
8. rm -rf ios/Pods
9. rm -rf ios/Podfile.lock
10. rm -rf ios/Flutter/App.framework
11. rm -rf ios/Flutter/Flutter.podspec

---

### pod install 시 "Pods/Target Support Files/Pods-Runner/Pods-Runner.profile.xcconfig" 등의 에러가 뜨면 xcode 설정 변경 처리
1. 설정의 info 메뉴
2. Configurations 의 DEBUG, RELEASE, PROFILE의 설정을 아래와 같이 변경 처리
    - debug -> Pods-Runner.debugq
    - Release -> Pods-Runner.profile
    - Profile -> Pods-Runner.release


### Flutter에 아이폰으로 빌드시 iproxy 관련 오류시
    sudo xattr -d com.apple.quarantine /플러터경로/bin/cache/artifacts/usbmuxd/iproxy
    sudo xattr -d com.apple.quarantine /플러터경로/bin/cache/artifacts/libimobiledevice/idevice_id
    sudo xattr -d com.apple.quarantine /플러터경로/bin/cache/artifacts/libimobiledevice/ideviceinfo



### IOS 기타빌드 에러
1. pod update 실행
2. 아래 설정값 추가
    * Xcode > Build Settings > Architectures > Excluded Architectures > Add "arm64"


### 파일빌드
    flutter build ipa
    flutter build ios --release
    flutter build ios --verbose
    flutter run -d "Mint Pro Max" --release
    flutter run -d "iPhone" --release
    flutter run -d "iPhone (3)" --release
    flutter build appbundle


### APK 파일 생성
    1. 터미널에서 해당 프로젝트 디렉토리로 이동
    2. flutter build apk --release --no-sound-null-safety --target-platform=android-arm64
    3. 파일 경로는 [Project Forder]/build/app/outputs/apk/release/app-release.apk
    혹은 cd android && ./gradlew clean && cd .. && flutter build apk --release --no-sound-null-safety --target-platform=android-arm64


### 파일 서명
    keytool -genkey -v -keystore /Users/kdonghwa/Workspace/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key


### 안드로이드 AAB 파일 빌드
    1. cd android
    2. ./gradlew bundleRelease
    3. cd ../build/app/outputs/bundle/release
    혹은 cd android && ./gradlew clean && ./gradlew :app:bundleRelease && cd ..


### 안드로이드 emulators 실행법
    1. flutter emulators
    2. To run an emulator, run 'flutter emulators --launch <emulator id>'