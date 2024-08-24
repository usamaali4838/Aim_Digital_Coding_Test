import 'package:aim_digital_coding_test/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser({required this.repository});

  Future<UserCredential?> call(String email, String password) async {
    return await repository.register(email, password);
  }
}
