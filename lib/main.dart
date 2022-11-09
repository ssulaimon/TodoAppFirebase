import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/controller/initial_binding.dart';
import 'package:todo_app_firebase/screens/home_page_screen.dart';
import 'package:todo_app_firebase/screens/login_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
    initialBinding: IntialBinding(),
    home: FirebaseAuth.instance.currentUser == null
        ? const LoginScreen()
        : const HomePageScreen(),
  ));
}
