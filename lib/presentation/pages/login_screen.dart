import 'package:aim_digital_coding_test/Utils/app_utils.dart';
import 'package:aim_digital_coding_test/Utils/textstyle_utils.dart';
import 'package:aim_digital_coding_test/presentation/cubit/login_cubit.dart';
import 'package:aim_digital_coding_test/presentation/pages/home_screen.dart';
import 'package:aim_digital_coding_test/presentation/widgets/custom_button_widget.dart';
import 'package:aim_digital_coding_test/presentation/widgets/custom_textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B2236),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            AppUtils.showLoader(context);
          } else if (state is LoginSuccess) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const HomeScreen()),
              (route) => false,
            );
          } else if (state is LoginError) {
            Navigator.of(context).pop(); // Close loading indicator
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Log in!',
                  textAlign: TextAlign.left,
                  style: TextStyleUtil.sfBoldTextStyle(
                    fontSize: 40,
                    color: const Color(0xffCD5B97),
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  controller: _emailController,
                  iconPath: 'assets/icons/at_email_icon.png',
                  labelText: 'Email',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  iconPath: 'assets/icons/lock_icon.png',
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                Center(
                  child: CustomButton(
                    onTap: () {
                      context.read<LoginCubit>().login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                    },
                    buttonText: 'Login',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
