import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_app_firebase/authentication/login_function.dart';
import 'package:todo_app_firebase/colors/colors.dart';
import 'package:todo_app_firebase/controller/loading_controller.dart';
import 'package:todo_app_firebase/screens/creeate_account_screen.dart';
import 'package:todo_app_firebase/screens/forgetpassword_screen.dart';
import 'package:todo_app_firebase/text_validator/text_validator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    var loading = Get.put(Loading());
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) => textValidatoraEmail(value),
                controller: email,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: colors)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                validator: (value) => textValidatorPassword(value),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: colors)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Get.to(const ForgetPasswordScreen());
                },
                child: const Text(
                  'Forget Password?',
                ),
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    colors,
                  ),
                ),
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    loading.setState(
                      state: true,
                    );

                    await LoginFunction(email: email, password: password)
                        .login();
                    loading.setState(
                      state: false,
                    );
                  }
                },
                icon: const Icon(Icons.forward),
                label: const Text(
                  'login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      colors,
                    ),
                  ),
                  onPressed: () {
                    Get.to(const CreateAccountScreen());
                  },
                  icon: const Icon(Icons.person),
                  label: const Text(
                    'Create new account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              GetX<Loading>(
                  builder: (state) => state.loading.value == false
                      ? const SizedBox()
                      : const CircularProgressIndicator(
                          color: colors,
                        ))
            ],
          ),
        )),
      ),
    );
  }
}
