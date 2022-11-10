import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/authentication/forget_password_function.dart';
import 'package:todo_app_firebase/colors/colors.dart';
import 'package:todo_app_firebase/controller/loading_controller.dart';
import 'package:todo_app_firebase/text_validator/text_validator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    final loading = Get.put(Loading());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'RESET PASSWORD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) => textValidatoraEmail(
                  value,
                ),
                controller: email,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colors,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colors,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  colors,
                )),
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    loading.setState(
                      state: true,
                    );
                    String result = await ForgetPasswordFunction(email: email)
                        .forgetPasswordFunction();
                    loading.setState(
                      state: false,
                    );
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text(
                  'Send reset link',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
    );
  }
}
