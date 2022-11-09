import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/constant/const.dart';
import 'package:todo_app_firebase/models/todo_model.dart';

class FirebaseFirestoreFunction {
  TextEditingController task;
  TextEditingController title;
  FirebaseFirestoreFunction({
    required this.task,
    required this.title,
  });
  Future<void> addNewTask() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    TodoModel todoModel = TodoModel(
      title: title.text,
      task: task.text,
      dateTime: DateTime.now(),
    );
    var addTask = await firebaseFirestore
        .collection(userId)
        .doc()
        .set(todoModel.tojson());
    Get.snackbar('Task', 'Task added');
    try {} catch (e) {
      Get.snackbar('Erorr', e.toString());
    }
  }
}
