import 'package:aim_digital_coding_test/domain/repositories/auth_repository.dart';

class LogoutUser {
  final AuthRepository repository;

  LogoutUser({required this.repository});

  Future<void> call() async {
    return await repository.logout();
  }
}
