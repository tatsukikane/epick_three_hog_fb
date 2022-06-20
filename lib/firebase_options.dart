// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC7IzhsFVtJZ7A5P_luc92JRGVgyMo28T4',
    appId: '1:580496482257:web:d2a0a9fd6f1a9fc5fdcaf0',
    messagingSenderId: '580496482257',
    projectId: 'epick-three-hog',
    authDomain: 'epick-three-hog.firebaseapp.com',
    storageBucket: 'epick-three-hog.appspot.com',
    measurementId: 'G-E10PTCB23C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSFQ43kPo-dRVPc_HP5GZAT7KVsbH5PQA',
    appId: '1:580496482257:android:dd8c895b0b0573d6fdcaf0',
    messagingSenderId: '580496482257',
    projectId: 'epick-three-hog',
    storageBucket: 'epick-three-hog.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvwjVCFCGniNnbdwAJDWmZVepBFls-gY0',
    appId: '1:580496482257:ios:8e2b15ae465c038efdcaf0',
    messagingSenderId: '580496482257',
    projectId: 'epick-three-hog',
    storageBucket: 'epick-three-hog.appspot.com',
    iosClientId: '580496482257-dpkp8484ctsp74qjblscmve2hof01o54.apps.googleusercontent.com',
    iosBundleId: 'com.example.epickThreeHogFb',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvwjVCFCGniNnbdwAJDWmZVepBFls-gY0',
    appId: '1:580496482257:ios:8e2b15ae465c038efdcaf0',
    messagingSenderId: '580496482257',
    projectId: 'epick-three-hog',
    storageBucket: 'epick-three-hog.appspot.com',
    iosClientId: '580496482257-dpkp8484ctsp74qjblscmve2hof01o54.apps.googleusercontent.com',
    iosBundleId: 'com.example.epickThreeHogFb',
  );
}
