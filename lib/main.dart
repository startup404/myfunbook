import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfunbook/controllers/auth_controller.dart';
import 'package:myfunbook/pages/login.dart';
import 'package:myfunbook/pages/signup.dart';
import 'package:myfunbook/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyBBxPcNdFc_iinZHTTYcj__Yf8tu9aqK40", appId: "1:713680475181:android:1b2d307d46996cf3d814a4", messagingSenderId: "713680475181", projectId: "myfunbook-f899e",)
  );
  Get.put(authcontroller());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'start template',
      home: splashscreen(),
    );
  }
}
