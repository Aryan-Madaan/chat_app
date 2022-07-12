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
    apiKey: 'AIzaSyAZYbpk1CL56giZb1wMPIQxAJDGl9fwBx0',
    appId: '1:493546123215:web:00d0c3dad0fa0007086cba',
    messagingSenderId: '493546123215',
    projectId: 'chat-app-af83e',
    authDomain: 'chat-app-af83e.firebaseapp.com',
    storageBucket: 'chat-app-af83e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCuCR0oWUyZIg35eSRHsvTJMhDeBEiyiso',
    appId: '1:493546123215:android:bee51d6e25a7013d086cba',
    messagingSenderId: '493546123215',
    projectId: 'chat-app-af83e',
    storageBucket: 'chat-app-af83e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA4pwvco4AiNt_zfYBYwexMBPsSXBOuvcE',
    appId: '1:493546123215:ios:da53e0e6b193e495086cba',
    messagingSenderId: '493546123215',
    projectId: 'chat-app-af83e',
    storageBucket: 'chat-app-af83e.appspot.com',
    iosClientId: '493546123215-ebkrcm1olavv1qv9d8s6vaqmaph62vb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA4pwvco4AiNt_zfYBYwexMBPsSXBOuvcE',
    appId: '1:493546123215:ios:da53e0e6b193e495086cba',
    messagingSenderId: '493546123215',
    projectId: 'chat-app-af83e',
    storageBucket: 'chat-app-af83e.appspot.com',
    iosClientId: '493546123215-ebkrcm1olavv1qv9d8s6vaqmaph62vb6.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
