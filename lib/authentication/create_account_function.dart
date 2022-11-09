import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateAccountFunction {
  TextEditingController email;
  TextEditingController password;
  TextEditingController repassword;
  TextEditingController name;
  File file;
  CreateAccountFunction({
    required this.file,
    required this.email,
    required this.name,
    required this.password,
    required this.repassword,
  });

  Future<String> createAccount() async {
    UserCredential? userCredentials;
    User? user;
    FirebaseStorage firebaseStorage;

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

        firebaseStorage = FirebaseStorage.instance;
        TaskSnapshot taskSnapshot =
            await firebaseStorage.ref().child(user!.uid).putFile(file);
        userCredentials.user!.updatePhotoURL(
          await taskSnapshot.ref.getDownloadURL(),
        );
        await user.reload();
        user = userCredentials.user;
        Get.snackbar(
          'Successful',
          'Account created',
        );
        return 'Account Created';
      } else {
        Get.snackbar('Password', 'Password does not match');
        return 'password does not match';
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Erorr',
        e.code,
      );
      return e.message.toString();
    }
  }
}
