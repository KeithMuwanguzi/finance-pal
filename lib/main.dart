import 'package:finance_pal/database/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) {
      Get.put(AuthController());
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinancePal',
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        body: Center(
          child: Padding(
              padding: const EdgeInsets.only(left: 70.0, right: 70),
              child: LottieBuilder.asset('assets/loading.json')),
        ),
      ),
    );
  }
}
