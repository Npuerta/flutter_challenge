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
    apiKey: 'AIzaSyB7TrAFfQRAVHpkksVcli9r6h6cvJwmKAo',
    appId: '1:1071519170977:web:162605f26776e9d7168be0',
    messagingSenderId: '1071519170977',
    projectId: 'appnews-97a3d',
    authDomain: 'appnews-97a3d.firebaseapp.com',
    storageBucket: 'appnews-97a3d.appspot.com',
    measurementId: 'G-9S50T0PMKJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcFrowuEqcgioOINebCOWEDb0vRbuO6Mk',
    appId: '1:1071519170977:android:774b95db46503496168be0',
    messagingSenderId: '1071519170977',
    projectId: 'appnews-97a3d',
    storageBucket: 'appnews-97a3d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvV0DA5eaZZdUD3427u5ulIe3yBrnOZdM',
    appId: '1:1071519170977:ios:98ef936459dd1a1c168be0',
    messagingSenderId: '1071519170977',
    projectId: 'appnews-97a3d',
    storageBucket: 'appnews-97a3d.appspot.com',
    iosBundleId: 'com.example.appNews',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvV0DA5eaZZdUD3427u5ulIe3yBrnOZdM',
    appId: '1:1071519170977:ios:98ef936459dd1a1c168be0',
    messagingSenderId: '1071519170977',
    projectId: 'appnews-97a3d',
    storageBucket: 'appnews-97a3d.appspot.com',
    iosBundleId: 'com.example.appNews',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7TrAFfQRAVHpkksVcli9r6h6cvJwmKAo',
    appId: '1:1071519170977:web:c2febb4cfdd6540a168be0',
    messagingSenderId: '1071519170977',
    projectId: 'appnews-97a3d',
    authDomain: 'appnews-97a3d.firebaseapp.com',
    storageBucket: 'appnews-97a3d.appspot.com',
    measurementId: 'G-R85HSS7JFZ',
  );
}
