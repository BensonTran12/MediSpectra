import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBuOPQ8wrofwaJnm92y7IFAuM4BRqk_GR4",
            authDomain: "medical-ec3d7h.firebaseapp.com",
            projectId: "medical-ec3d7h",
            storageBucket: "medical-ec3d7h.firebasestorage.app",
            messagingSenderId: "384239651806",
            appId: "1:384239651806:web:35495ef1b324b61d0bab4f"));
  } else {
    await Firebase.initializeApp();
  }
}
