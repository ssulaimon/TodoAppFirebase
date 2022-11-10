import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_firebase/authentication/create_account_function.dart';
import 'package:todo_app_firebase/colors/colors.dart';
import 'package:todo_app_firebase/controller/image_picker_controller.dart';
import 'package:todo_app_firebase/controller/loading_controller.dart';
import 'package:todo_app_firebase/text_validator/text_validator.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePicker = Get.put(ImagePickerController());
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController repassword = TextEditingController();
    TextEditingController name = TextEditingController();
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    final loading = Get.put(Loading());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetX<ImagePickerController>(builder: (image) {
                  return Stack(
                    children: [
                      image.image.value == null
                          ? const CircleAvatar(
                              radius: 80,
                            )
                          : CircleAvatar(
                              radius: 80,
                              backgroundImage: FileImage(
                                image.image.value!,
                              ),
                            ),
                      Positioned(
                        top: 120,
                        left: 100,
                        child: IconButton(
                          onPressed: () {
                            image.pickImage();
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  validator: (value) => textValidatorName(value),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colors)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) => textValidatoraEmail(value),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colors)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) => textValidatorPassword(value),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colors)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors))),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: repassword,
                  validator: (value) => textValidatorPassword(value),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Confirm password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: colors)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors))),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetX<ImagePickerController>(
                  builder: (image) {
                    return ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          colors,
                        ),
                      ),
                      onPressed: image.image.value == null
                          ? () {}
                          : () async {
                              if (_key.currentState!.validate()) {
                                loading.setState(
                                  state: true,
                                );
                                String result = await CreateAccountFunction(
                                        email: email,
                                        name: name,
                                        password: password,
                                        repassword: repassword,
                                        file: image.image.value!)
                                    .createAccount();
                                loading.setState(
                                  state: false,
                                );
                              }
                            },
                      icon: const Icon(Icons.person_add),
                      label: image.image.value == null
                          ? const Text('Complete registration form')
                          : const Text('Create Account'),
                    );
                  },
                ),
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
          ),
        ),
      ),
    );
  }
}
