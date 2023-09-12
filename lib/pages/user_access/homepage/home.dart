import 'package:finance_pal/database/controllers/auth_controller.dart';
import 'package:finance_pal/widgets/textwidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                AuthController.instance.signOut();
              },
              child: const TextWidget(
                size: 14,
                text: 'HomePage',
                bold: false,
                align: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
