import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions không hỗ trợ platform này',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAP86YkZb-JxMP8dJBPG2k8SSOrmDXiFqg',
    appId: '1:160645220973:web:9346287f9c6400488c0d64',
    messagingSenderId: '160645220973',
    projectId: 'efep-be',
    authDomain: 'efep-be.firebaseapp.com',
    storageBucket: 'efep-be.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCESpJq8dxwh_tuzYS53SOgUMcE8t-69J8',
    appId: '1:160645220973:android:7f57674804634ca48c0d64',
    messagingSenderId: '160645220973',
    projectId: 'efep-be',
    storageBucket: 'efep-be.firebasestorage.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_ce6l4NAiS-ii7itKe50V4qH-L3EDoc0',
    appId: '1:160645220973:ios:df5b4dd8975fce288c0d64',
    messagingSenderId: '160645220973',
    projectId: 'efep-be',
    storageBucket: 'efep-be.firebasestorage.app',
    iosBundleId: 'com.example.efepChat',
  );
}
