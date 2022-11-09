import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// login to account
class LoginFunction {
  TextEditingController email;
  TextEditingController password;
  LoginFunction({
    required this.email,
    required this.password,
  });

  Future<String> login() async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Get.snackbar('Login', 'Account login successful');
      return 'User logged in';
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.code,
      );
      return e.message.toString();
    }
  }
}
