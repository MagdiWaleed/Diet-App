import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserAuthRepository extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user;
  }
}
