import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_firebase/authentication/create_account_function.dart';
import 'package:todo_app_firebase/controller/image_picker_controller.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Form(
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
                            child: Image(
                              image: FileImage(image.image.value!),
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
                height: 10,
              ),
              TextFormField(
                controller: name,
                validator: (value) => textValidatorName(value),
                decoration: const InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: email,
                validator: (value) => textValidatoraEmail(value),
                decoration: const InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: password,
                validator: (value) => textValidatorPassword(value),
                decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: repassword,
                validator: (value) => textValidatorPassword(value),
                decoration: const InputDecoration(
                    hintText: 'Confirm password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    String result = await CreateAccountFunction(
                      email: email,
                      name: name,
                      password: password,
                      repassword: repassword,
                    ).createAccount();
                  }
                },
                icon: const Icon(Icons.person_add),
                label: const Text('Create Account'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
