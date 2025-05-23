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
    apiKey: 'AIzaSyDGQD0WXWG-0Iji0Jvs_qjoigvlHNznDKg',
    appId: '1:143135305604:web:2cd1845c242f268f9b37d1',
    messagingSenderId: '143135305604',
    projectId: 'cursos-erelis-8203e',
    authDomain: 'cursos-erelis-8203e.firebaseapp.com',
    storageBucket: 'cursos-erelis-8203e.firebasestorage.app',
    measurementId: 'G-MJXDP2E28C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCToNY-7TJY_wO0IWqwjYsq04dmVg2SAqg',
    appId: '1:143135305604:android:51ba88814c32cb889b37d1',
    messagingSenderId: '143135305604',
    projectId: 'cursos-erelis-8203e',
    storageBucket: 'cursos-erelis-8203e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCAULhCtcYrjbrCgvVvd8xiu3mAmKPX1_U',
    appId: '1:143135305604:ios:57ac4cc335cabe9a9b37d1',
    messagingSenderId: '143135305604',
    projectId: 'cursos-erelis-8203e',
    storageBucket: 'cursos-erelis-8203e.firebasestorage.app',
    iosClientId: '143135305604-g5n4h2rqu3jtb442docj3fefq4qq3vs0.apps.googleusercontent.com',
    iosBundleId: 'com.example.erelis',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCAULhCtcYrjbrCgvVvd8xiu3mAmKPX1_U',
    appId: '1:143135305604:ios:57ac4cc335cabe9a9b37d1',
    messagingSenderId: '143135305604',
    projectId: 'cursos-erelis-8203e',
    storageBucket: 'cursos-erelis-8203e.firebasestorage.app',
    iosClientId: '143135305604-g5n4h2rqu3jtb442docj3fefq4qq3vs0.apps.googleusercontent.com',
    iosBundleId: 'com.example.erelis',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGQD0WXWG-0Iji0Jvs_qjoigvlHNznDKg',
    appId: '1:143135305604:web:8e36fef4039a1fd79b37d1',
    messagingSenderId: '143135305604',
    projectId: 'cursos-erelis-8203e',
    authDomain: 'cursos-erelis-8203e.firebaseapp.com',
    storageBucket: 'cursos-erelis-8203e.firebasestorage.app',
    measurementId: 'G-HFY7BJ16ED',
  );
}
