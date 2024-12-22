// import 'dart:io' show Platform;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
//
// class DefaultFirebaseOptions {
//   FirebaseOptions currentPlatform() {
//     if (kIsWeb) {
//       print("Running on Web");
//     } else if (Platform.isAndroid) {
//       print("Running on Android");
//       return android;
//     } else if (Platform.isIOS) {
//       print("Running on iOS");
//       return UnimplementedError();
//     } else if (Platform.isLinux) {
//       print("Running on Linux");
//     } else if (Platform.isMacOS) {
//       print("Running on macOS");
//     } else if (Platform.isWindows) {
//       print("Running on Windows");
//     }
//     FirebaseOptions android = FirebaseOptions(
//         apiKey: apiKey,
//         appId: appId,
//         messagingSenderId: messagingSenderId,
//         projectId: projectId);
//   }
// }
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDdDSSGlPh9r7Et5dmFPNaMr-84ey8c-kc',
    appId: '1:824236791380:android:6b060b1e3bb75e3c5a3fc1',
    messagingSenderId: '824236791380',
    projectId: 'ohmytennis-7ca99',
    storageBucket: 'ohmytennis-7ca99.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYAVkD4XtALqCNcescKuBke9NgHhHTGac',
    appId: '1:325637134454:ios:3f292c783fe4b431dda757',
    messagingSenderId: '325637134454',
    projectId: 'ohmytennis-32f49',
    storageBucket: 'ohmytennis-32f49.appspot.com',
    iosBundleId: 'CloudNausor.OhMyTennisPro.com',
  );
}
