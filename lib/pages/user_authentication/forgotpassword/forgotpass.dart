import 'package:finance_pal/widgets/reusable_submit_button.dart';
import 'package:finance_pal/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 300, 30, 0),
            child: Column(
              children: [
                const Icon(
                  Icons.reset_tv,
                  size: 100,
                ),
                TextWidget(
                  size: 14,
                  text:
                      'Your password reset procedure has been sent to $email. Check your inbox to continue.',
                  bold: false,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 10),
                SubmitButton(
                  text: 'LOGIN',
                  ontap: () {
                    Get.back();
                  },
                  color: Colors.deepPurple,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
