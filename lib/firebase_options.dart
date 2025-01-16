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
    apiKey: 'AIzaSyDnA_zC8X1U7tqZJ25tMRxRCJIeuNyvEZ8',
    appId: '1:242325118219:web:090644a2ada6c8e241d60e',
    messagingSenderId: '242325118219',
    projectId: 'app-watch-hub-c18f2',
    authDomain: 'app-watch-hub-c18f2.firebaseapp.com',
    storageBucket: 'app-watch-hub-c18f2.firebasestorage.app',
    measurementId: 'G-30GVE56C89',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkRwUCIjBc7s--clIlY8jQ1uVKcpaqr7c',
    appId: '1:242325118219:android:478d9e4226d22a2141d60e',
    messagingSenderId: '242325118219',
    projectId: 'app-watch-hub-c18f2',
    storageBucket: 'app-watch-hub-c18f2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2Wv--nwFRB7V8ZQz_qS72Dq_q3_NYzfo',
    appId: '1:242325118219:ios:42c307dc201ac9ba41d60e',
    messagingSenderId: '242325118219',
    projectId: 'app-watch-hub-c18f2',
    storageBucket: 'app-watch-hub-c18f2.firebasestorage.app',
    iosBundleId: 'com.example.ecom',
  );
}