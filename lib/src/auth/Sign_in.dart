import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signIn(String email, String password) async {
  try {
    UserCredential? userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } catch (error) {
    print("Sign In Error: $error");
    return null;
  }
}
