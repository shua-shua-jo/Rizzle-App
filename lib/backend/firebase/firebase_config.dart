import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDnI_xV6mGdmTVfGdENqnnKiRo7xOKO9_U",
            authDomain: "test-daz7tz.firebaseapp.com",
            projectId: "test-daz7tz",
            storageBucket: "test-daz7tz.appspot.com",
            messagingSenderId: "1043875124767",
            appId: "1:1043875124767:web:b1e86c3cd4a8f09838a72a"));
  } else {
    await Firebase.initializeApp();
  }
}
