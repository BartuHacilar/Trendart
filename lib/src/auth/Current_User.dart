import 'package:firebase_auth/firebase_auth.dart';

User? getCurrentUser() {
  User? user = FirebaseAuth.instance.currentUser;
  return user;
}
