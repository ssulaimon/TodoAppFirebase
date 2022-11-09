import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app_firebase/authentication/forget_password_function.dart';
import 'package:todo_app_firebase/text_validator/text_validator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
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
                  fontSize: 30,
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
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder()),
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    if (_key.currentState!.validate()) {
                      String result = await ForgetPasswordFunction(email: email)
                          .forgetPasswordFunction();
                    }
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Send reset link'))
            ],
          ),
        ),
      ),
    );
  }
}
