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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8uwiI-JP6aEbQPoa-ac_9mFkDhvFFOKc',
    appId: '1:1084608256588:android:249a420b4fe0ffddbb32e9',
    messagingSenderId: '1084608256588',
    projectId: 'fir-ders-f77bb',
    storageBucket: 'fir-ders-f77bb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAgXSCQJa75H1PdzXwbxM07z_geFKq_bI',
    appId: '1:1084608256588:ios:57c54f2b8da04070bb32e9',
    messagingSenderId: '1084608256588',
    projectId: 'fir-ders-f77bb',
    storageBucket: 'fir-ders-f77bb.appspot.com',
    androidClientId: '1084608256588-hlkc11u02g9p0ft4stm6rmfbbteg83hg.apps.googleusercontent.com',
    iosClientId: '1084608256588-8mtraale8cf2madofkt4g4l74npdbdq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseNotdefteri',
  );
}
