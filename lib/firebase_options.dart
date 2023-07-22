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
    apiKey: 'AIzaSyCrrJNwQbIKy78a6pOQ_iLefagNgi9vRyU',
    appId: '1:907198853955:web:dba08462382678c492b5f6',
    messagingSenderId: '907198853955',
    projectId: 'coinnews-prod',
    authDomain: 'coinnews-prod.firebaseapp.com',
    storageBucket: 'coinnews-prod.appspot.com',
    measurementId: 'G-RZY5FZT14Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1tS7eI2OwmcvnrdbqSfv-Hkl2XNaL7CA',
    appId: '1:907198853955:android:f321baf916bdcd6492b5f6',
    messagingSenderId: '907198853955',
    projectId: 'coinnews-prod',
    storageBucket: 'coinnews-prod.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD-uz53lXiPBKd7bKWukxwC4wwZIsnrL1M',
    appId: '1:907198853955:ios:be205730c3b17eeb92b5f6',
    messagingSenderId: '907198853955',
    projectId: 'coinnews-prod',
    storageBucket: 'coinnews-prod.appspot.com',
    iosClientId: '907198853955-g6qv7kkok80aupb6ppeb27imtqakctkt.apps.googleusercontent.com',
    iosBundleId: 'com.example.coinNewsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD-uz53lXiPBKd7bKWukxwC4wwZIsnrL1M',
    appId: '1:907198853955:ios:c9a85291c8c2b5df92b5f6',
    messagingSenderId: '907198853955',
    projectId: 'coinnews-prod',
    storageBucket: 'coinnews-prod.appspot.com',
    iosClientId: '907198853955-1qskt9stvpgf4cp069gsjsuj6kiv7gep.apps.googleusercontent.com',
    iosBundleId: 'com.example.coinNewsApp.RunnerTests',
  );
}
