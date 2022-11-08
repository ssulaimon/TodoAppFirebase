import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/controller/initial_binding.dart';
import 'package:todo_app_firebase/screens/login_screen.dart';

void main() {
  runApp(GetMaterialApp(
    initialBinding: IntialBinding(),
    home: const LoginScreen(),
  ));
}
