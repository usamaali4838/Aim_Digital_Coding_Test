import 'package:aim_digital_coding_test/data/datasources/firebase_auth_data_source.dart';
import 'package:aim_digital_coding_test/data/repositories/auth_repository_impl.dart';
import 'package:aim_digital_coding_test/domain/usecases/login_user.dart';
import 'package:aim_digital_coding_test/domain/usecases/logout_user.dart';
import 'package:aim_digital_coding_test/domain/usecases/register_user.dart';
import 'package:aim_digital_coding_test/presentation/cubit/login_cubit.dart';
import 'package:aim_digital_coding_test/presentation/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            loginUser: LoginUser(
              repository: AuthRepositoryImpl(
                firebaseAuthDataSource: FirebaseAuthDataSourceImpl(
                  firebaseAuth: FirebaseAuth.instance,
                ),
              ),
            ),
            registerUser: RegisterUser(
              repository: AuthRepositoryImpl(
                firebaseAuthDataSource: FirebaseAuthDataSourceImpl(
                  firebaseAuth: FirebaseAuth.instance,
                ),
              ),
            ),
            logoutUser: LogoutUser(
              repository: AuthRepositoryImpl(
                firebaseAuthDataSource: FirebaseAuthDataSourceImpl(
                  firebaseAuth: FirebaseAuth.instance,
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
