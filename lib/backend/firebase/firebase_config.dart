import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAtTMq1gxDI5hDV1ovl_cFZz9vPN6trf9M",
            authDomain: "i7-marketing-test-project.firebaseapp.com",
            projectId: "i7-marketing-test-project",
            storageBucket: "i7-marketing-test-project.appspot.com",
            messagingSenderId: "113335212342",
            appId: "1:113335212342:web:825b21a87ffb4d47ba3b97",
            measurementId: "G-SG2XD4BSWY"));
  } else {
    await Firebase.initializeApp();
  }
}
