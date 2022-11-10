import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordFunction {
  TextEditingController email;

  ForgetPasswordFunction({
    required this.email,
  });

  Future<String> forgetPasswordFunction() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );

      Get.snackbar(
        'Request link',
        'Please check your email to change your password',
      );
      return 'Reset link sent';
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Erorr',
        e.code,
      );
      return e.message.toString();
    }
  }
}
