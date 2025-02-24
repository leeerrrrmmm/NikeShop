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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqeSu7bYLAB8UGDILEUXpRaRjYp1H4RjQ',
    appId: '1:850257494363:android:64aec0ecd4065e22771a7e',
    messagingSenderId: '850257494363',
    projectId: 'nike-e-commerce-shop',
    storageBucket: 'nike-e-commerce-shop.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-oB6p9ckVzmHs5UpyH00loWiuKjsdduk',
    appId: '1:850257494363:ios:d0dee864d575d258771a7e',
    messagingSenderId: '850257494363',
    projectId: 'nike-e-commerce-shop',
    storageBucket: 'nike-e-commerce-shop.firebasestorage.app',
    iosBundleId: 'com.example.nikeEShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-oB6p9ckVzmHs5UpyH00loWiuKjsdduk',
    appId: '1:850257494363:ios:d0dee864d575d258771a7e',
    messagingSenderId: '850257494363',
    projectId: 'nike-e-commerce-shop',
    storageBucket: 'nike-e-commerce-shop.firebasestorage.app',
    iosBundleId: 'com.example.nikeEShop',
  );
}
