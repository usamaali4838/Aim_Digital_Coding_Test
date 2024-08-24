import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthDataSource {
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password);
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
