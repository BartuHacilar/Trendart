import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential?> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return userCredential;
  } catch (error) {
    print("Sign Up Error: $error");
    return null;
  }
}
