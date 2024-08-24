import 'package:aim_digital_coding_test/Utils/textstyle_utils.dart';
import 'package:aim_digital_coding_test/presentation/pages/login_screen.dart';
import 'package:aim_digital_coding_test/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1B2236),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Welcome To Home Screen',
              style: TextStyleUtil.sfMediumTextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CustomButton(
              onTap: () {
                context.read<LoginCubit>().logout();
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                  (route) => false,
                );
              },
              buttonText: 'Logout',
            ),
          ),
        ],
      ),
    );
  }
}
