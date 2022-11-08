import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginFunction {
  TextEditingController email;
  TextEditingController password;
  LoginFunction({
    required this.email,
    required this.password,
  });

  Future<String> login() async {
    UserCredential? userCredential;
    // User? user;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      return 'User logged in';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
