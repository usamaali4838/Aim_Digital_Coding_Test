import 'package:aim_digital_coding_test/data/datasources/firebase_auth_data_source.dart';
import 'package:aim_digital_coding_test/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;

  AuthRepositoryImpl({required this.firebaseAuthDataSource});

  @override
  Future<UserCredential?> login(String email, String password) async {
    return await firebaseAuthDataSource.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<UserCredential?> register(String email, String password) async {
    return await firebaseAuthDataSource.registerWithEmailAndPassword(email, password);
  }

  @override
  Future<void> logout() async {
    try {
      return await firebaseAuthDataSource.signOut();
    } catch (e) {
      throw Exception('Failed to logout: $e');
    }
  }
}
