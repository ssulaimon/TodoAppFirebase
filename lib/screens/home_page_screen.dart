import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/bottom_sheet/bottom_sheet_widget.dart';
import 'package:todo_app_firebase/colors/colors.dart';
import 'package:todo_app_firebase/constant/const.dart';
import 'package:todo_app_firebase/screens/login_screen.dart';
import 'package:todo_app_firebase/screens/task_list_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      profileImage,
                    ),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.off(const LoginScreen());
                      },
                      icon: const Icon(Icons.logout_outlined))
                ],
              ),
            ),
            TaskListScreen(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colors,
        onPressed: () {
          showBottomSheetWidget();
        },
        label: const Text('New'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
