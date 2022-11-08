import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountFunction {
  TextEditingController email;
  TextEditingController password;
  TextEditingController repassword;
  TextEditingController name;
  CreateAccountFunction({
    required this.email,
    required this.name,
    required this.password,
    required this.repassword,
  });

  Future<String> createAccount() async {
    UserCredential? userCredentials;
    User? user;

    try {
      if (password.text == repassword.text) {
        userCredentials =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        user = userCredentials.user;
        await user!.updateDisplayName(
          name.text,
        );
        await user.reload();
        user = userCredentials.user;
        return 'Account Created';
      } else {
        return 'password does not match';
      }
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    }
  }
}
