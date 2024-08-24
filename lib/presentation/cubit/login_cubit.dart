import 'package:aim_digital_coding_test/domain/usecases/login_user.dart';
import 'package:aim_digital_coding_test/domain/usecases/logout_user.dart';
import 'package:aim_digital_coding_test/domain/usecases/register_user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final LogoutUser logoutUser;

  LoginCubit({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
  }) : super(LoginInitial());


  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    if (email.isEmpty) {
      emit(const LoginError('Email cannot be empty.'));
      return;
    } else if (email.isNotEmpty && validateEmail(email) == false) {
      emit(const LoginError('Please input valid email.'));
      return;
    } else if (password.isEmpty) {
      emit(const LoginError('Password cannot be empty.'));
      return;
    } else if (password.isNotEmpty && validatePassword(password) == false) {
      emit(
        const LoginError('Please input valid password.\n1- Length should be greater than 6\n2- Must have numbers and characters'),
      );
      return;
    }

    try {
      UserCredential? userCredential = await loginUser(email, password);

      if (userCredential?.user == null) {
        emit(
          const LoginError('Login failed, please try again.'),
        );
      } else {
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        try {
          final user = await registerUser(email, password);
          if (user != null) {
            emit(LoginSuccess());
          } else {
            emit(const LoginError('Registration failed'));
          }
        } catch (e) {
          emit(LoginError('Failed to create user: $e'));
        }
      } else {
        emit(LoginError(e.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void logout() async {
    try {
      await logoutUser();
      emit(LoginInitial());
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  bool validateEmail(String email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$');
    return regex.hasMatch(email);
  }

  bool validatePassword(String pass) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{7,}$');
    return regex.hasMatch(pass);
  }
}
