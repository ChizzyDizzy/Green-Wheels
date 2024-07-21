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
    apiKey: 'AIzaSyC2W9PZteEUboByTOmcC-t_HBThg1E8wEM',
    appId: '1:530541456838:web:faa8eadfb7aeb1c70056c7',
    messagingSenderId: '530541456838',
    projectId: 'green-wheels-97a8a',
    authDomain: 'green-wheels-97a8a.firebaseapp.com',
    databaseURL: 'https://green-wheels-97a8a-default-rtdb.firebaseio.com',
    storageBucket: 'green-wheels-97a8a.appspot.com',
    measurementId: 'G-ZBD51LZ6TE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8ZMnztS5H0oBP29_zQ4K7s0_IoROkq3g',
    appId: '1:530541456838:android:058863920df85acd0056c7',
    messagingSenderId: '530541456838',
    projectId: 'green-wheels-97a8a',
    databaseURL: 'https://green-wheels-97a8a-default-rtdb.firebaseio.com',
    storageBucket: 'green-wheels-97a8a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdnkNmF2cAJ2o88LVMaB15mK3y78DnW6E',
    appId: '1:530541456838:ios:c6d7b04aa7a42ce00056c7',
    messagingSenderId: '530541456838',
    projectId: 'green-wheels-97a8a',
    databaseURL: 'https://green-wheels-97a8a-default-rtdb.firebaseio.com',
    storageBucket: 'green-wheels-97a8a.appspot.com',
    iosBundleId: 'com.example.driversApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAdnkNmF2cAJ2o88LVMaB15mK3y78DnW6E',
    appId: '1:530541456838:ios:c6d7b04aa7a42ce00056c7',
    messagingSenderId: '530541456838',
    projectId: 'green-wheels-97a8a',
    databaseURL: 'https://green-wheels-97a8a-default-rtdb.firebaseio.com',
    storageBucket: 'green-wheels-97a8a.appspot.com',
    iosBundleId: 'com.example.driversApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC2W9PZteEUboByTOmcC-t_HBThg1E8wEM',
    appId: '1:530541456838:web:99ff8dbc0b579ed80056c7',
    messagingSenderId: '530541456838',
    projectId: 'green-wheels-97a8a',
    authDomain: 'green-wheels-97a8a.firebaseapp.com',
    databaseURL: 'https://green-wheels-97a8a-default-rtdb.firebaseio.com',
    storageBucket: 'green-wheels-97a8a.appspot.com',
    measurementId: 'G-1HD0JVSC47',
  );
}
