import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app_firebase/constant/const.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> _stream =
        FirebaseFirestore.instance.collection(userId).snapshots();
    return StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Expanded(
              child: Center(
                child: Text('Erorr'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Expanded(
              flex: 1,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              children:
                  snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
                Map<String, dynamic> tasks =
                    documentSnapshot.data() as Map<String, dynamic>;

                return Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title: ${tasks['title']}'),
                      Text(
                        'Task: ${tasks['task']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      tasks['status'] == 'pending'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Status: ${tasks['status']}'),
                                Checkbox(
                                  value: false,
                                  onChanged: (value) async {
                                    await FirebaseFirestore.instance
                                        .collection(userId)
                                        .doc(documentSnapshot.id)
                                        .update({'status': 'done'});
                                  },
                                  activeColor: Colors.white,
                                  checkColor: Colors.black,
                                  fillColor:
                                      MaterialStateProperty.all(Colors.white),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Status: Completed'),
                                Icon(Icons.check),
                              ],
                            ),
                      Center(
                        child: IconButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection(userId)
                                  .doc(documentSnapshot.id)
                                  .delete();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        });
  }
}
