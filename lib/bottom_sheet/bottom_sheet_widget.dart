import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/firebase_firestore/firebase_firestore_function.dart';

void showBottomSheetWidget() {
  TextEditingController title = TextEditingController();
  TextEditingController todo = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  Get.bottomSheet(
    SingleChildScrollView(
      child: Form(
        key: _key,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const Text('Add My Task'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                validator: (value) {
                  // ignore: deprecated_member_use
                  if (value == null) {
                    return ' Title cannot be null';
                  } else if (value.isEmpty) {
                    return 'Title cannot be empty';
                  } else {
                    return null;
                  }
                },
                controller: title,
                decoration: const InputDecoration(
                  hintText: 'Title',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null) {
                    return ' Task cannot be null';
                  } else if (value.isEmpty) {
                    return 'Task cannot be empty';
                  } else {
                    return null;
                  }
                }),
                controller: todo,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Task',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    await FirebaseFirestoreFunction(
                      task: todo,
                      title: title,
                    ).addNewTask();
                    Get.back();
                  }
                },
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text('Add todo'),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
