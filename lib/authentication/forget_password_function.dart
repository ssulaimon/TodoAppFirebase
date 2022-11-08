import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ForgetPasswordFunction {
  TextEditingController email;

  ForgetPasswordFunction({
    required this.email,
  });

  Future<String> forgetPasswordFunction() async {
    try {
      var sendLink = await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      return 'Reset link sent';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
