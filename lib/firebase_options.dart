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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCSHjVzly2O3tRiSFKVA0-Hw1BrA081aoI',
    appId: '1:613368996203:web:9a8cac910097dfddb3ac2e',
    messagingSenderId: '613368996203',
    projectId: 'toko-buku-395415',
    authDomain: 'toko-buku-395415.firebaseapp.com',
    storageBucket: 'toko-buku-395415.appspot.com',
    measurementId: 'G-K82V2KXKGW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBwR5WwaeyI28Z-7GXPaGCb0YRIgQlMbU',
    appId: '1:613368996203:android:85abef28b8993a81b3ac2e',
    messagingSenderId: '613368996203',
    projectId: 'toko-buku-395415',
    storageBucket: 'toko-buku-395415.appspot.com',
  );
}
