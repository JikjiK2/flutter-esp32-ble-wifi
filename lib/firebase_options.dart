import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// /// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBXgy0GrlHxG-7aIQyMmnsPzJUub7H1ApI',
    appId: '1:286686355982:web:35799064f17f41e185925f',
    messagingSenderId: '286686355982',
    projectId: 'esp32-fastapi-mqtt',
    authDomain: 'esp32-fastapi-mqtt.firebaseapp.com',
    storageBucket: 'esp32-fastapi-mqtt.firebasestorage.app',
    measurementId: 'G-6E840E2CVW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCq_dYm0TqeoucbV3bLvthQ87E6PB-LTic',
    appId: '1:286686355982:android:75305d2d7ac6311185925f',
    messagingSenderId: '286686355982',
    projectId: 'esp32-fastapi-mqtt',
    storageBucket: 'esp32-fastapi-mqtt.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7e0I0TaqI1TW_jCvTY-gJOjYzlrsWm3Q',
    appId: '1:286686355982:ios:c0b09f152fa3e24585925f',
    messagingSenderId: '286686355982',
    projectId: 'esp32-fastapi-mqtt',
    storageBucket: 'esp32-fastapi-mqtt.firebasestorage.app',
    iosBundleId: 'com.example.flutterEsp32BleWifi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7e0I0TaqI1TW_jCvTY-gJOjYzlrsWm3Q',
    appId: '1:286686355982:ios:c0b09f152fa3e24585925f',
    messagingSenderId: '286686355982',
    projectId: 'esp32-fastapi-mqtt',
    storageBucket: 'esp32-fastapi-mqtt.firebasestorage.app',
    iosBundleId: 'com.example.flutterEsp32BleWifi',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBXgy0GrlHxG-7aIQyMmnsPzJUub7H1ApI',
    appId: '1:286686355982:web:fbc4f045ac34d61785925f',
    messagingSenderId: '286686355982',
    projectId: 'esp32-fastapi-mqtt',
    authDomain: 'esp32-fastapi-mqtt.firebaseapp.com',
    storageBucket: 'esp32-fastapi-mqtt.firebasestorage.app',
    measurementId: 'G-98SR7BV0YC',
  );
}
