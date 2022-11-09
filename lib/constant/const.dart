import 'package:firebase_auth/firebase_auth.dart';

String userId = FirebaseAuth.instance.currentUser!.uid;
String name = FirebaseAuth.instance.currentUser!.displayName!;
String profileImage = FirebaseAuth.instance.currentUser!.photoURL!;
