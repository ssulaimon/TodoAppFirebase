import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:todo_app_firebase/firebase_options.dart';

class IntialBinding implements Bindings {
  @override
  void dependencies() async {
    // TODO: implement dependencies
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
