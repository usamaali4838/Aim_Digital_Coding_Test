import 'package:flutter/material.dart';

class AppUtils {
  static void showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (context) {
        return const PopScope(
          canPop: false,
          child: Center(
            child: Stack(
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
