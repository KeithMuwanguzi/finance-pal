import 'package:finance_pal/database/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  var isVisible = true.obs;
  var isConfirmVisible = true.obs;
  var isCheckedAgreement = false.obs;

  String? validateConfirmPassword(String? pass) {
    if (passwordController.text != confirmController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email can not be empty';
    }
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid Email format';
    }
    return null;
  }

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }

  void changeConfirmVisibility() {
    isConfirmVisible.value = !isConfirmVisible.value;
  }

  void changeAgreement() {
    isCheckedAgreement.value = !isCheckedAgreement.value;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return "Password is too short";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(password)) {
      return 'Invalid Password Format';
    }
    return null;
  }

  void registerNewUser({
    required String email,
    required String password,
  }) {
    AuthController.instance.createNewAccount(
      email: email,
      password: password,
    );
  }

  Future<void> verifyEmail() async {
    String message = await AuthController.instance.sendEmailVerification();
    if (message != 'success') {
      Get.snackbar('Failed Attempt', message);
    }
  }
}
