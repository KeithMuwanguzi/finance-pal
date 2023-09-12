import 'package:finance_pal/pages/user_authentication/forgotpassword/forgotpass.dart';
import 'package:finance_pal/pages/user_authentication/login/login_controller.dart';
import 'package:finance_pal/pages/user_authentication/signup/signup.dart';
import 'package:finance_pal/widgets/emailfield.dart';
import 'package:finance_pal/widgets/passwordfield.dart';
import 'package:finance_pal/widgets/reusable_submit_button.dart';
import 'package:finance_pal/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 120, 30, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset('assets/log.json'),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    children: [
                      Form(
                        key: controller.key,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              controller: controller.emailController,
                              validate: controller.validateEmail,
                              text: 'Email Address',
                              isPassword: false,
                            ),
                            const SizedBox(height: 20),
                            Obx(
                              () => CustomPasswordFormField(
                                controller: controller.passwordController,
                                validate: controller.validatePassword,
                                text: 'Password',
                                isVisible: controller.isVisible.value,
                                onPressed: controller.changeVisibility,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (controller
                                            .emailController.text.isEmpty) {
                                          Get.snackbar(
                                              'Error', 'Email can not be empty',
                                              snackPosition:
                                                  SnackPosition.BOTTOM);
                                        } else {
                                          Get.to(() => ForgotPassword(
                                              email: controller
                                                  .emailController.text
                                                  .trim()));
                                        }
                                      },
                                      child: const TextWidget(
                                        size: 12,
                                        text: 'Forgot Password?',
                                        bold: false,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            SubmitButton(
                              text: 'LOGIN',
                              ontap: () {
                                if (controller.key.currentState!.validate()) {
                                  controller.signInUser(
                                      email: controller.emailController.text,
                                      password:
                                          controller.passwordController.text);
                                }
                              },
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const TextWidget(
                            size: 12,
                            text: 'Not registered?',
                            bold: false,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpPage());
                            },
                            child: const TextWidget(
                              size: 14,
                              text: ' SignUp Now',
                              bold: false,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
