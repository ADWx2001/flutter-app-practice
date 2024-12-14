// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDTGX_qhjmL7KJtuSrpfxvjRUFgJSkyTXA',
    appId: '1:565394112882:web:a11bc0ecf6de70de295deb',
    messagingSenderId: '565394112882',
    projectId: 'flutter-socially-bb50c',
    authDomain: 'flutter-socially-bb50c.firebaseapp.com',
    storageBucket: 'flutter-socially-bb50c.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjwWW92D_ftqiVm7WYZ2e5Fbyrpl1FgYM',
    appId: '1:565394112882:android:8148aa7919207bfb295deb',
    messagingSenderId: '565394112882',
    projectId: 'flutter-socially-bb50c',
    storageBucket: 'flutter-socially-bb50c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6wwW0Jp-3fok8axbjtj03AqpXgoyjMks',
    appId: '1:565394112882:ios:17623f4f0147f08f295deb',
    messagingSenderId: '565394112882',
    projectId: 'flutter-socially-bb50c',
    storageBucket: 'flutter-socially-bb50c.firebasestorage.app',
    iosBundleId: 'com.example.sociallyApp',
  );
}