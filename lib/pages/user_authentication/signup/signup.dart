import 'package:finance_pal/pages/user_authentication/signup/signup_cont.dart';
import 'package:finance_pal/widgets/emailfield.dart';
import 'package:finance_pal/widgets/passwordfield.dart';
import 'package:finance_pal/widgets/reusable_submit_button.dart';
import 'package:finance_pal/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: Column(
              children: [
                LottieBuilder.asset('assets/log.json'),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Form(
                    key: controller.key,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          validate: controller.validateEmail,
                          text: 'Email Address',
                          isPassword: false,
                        ),
                        const SizedBox(height: 10),
                        const TextWidget(
                          size: 12,
                          text:
                              '''Password should be atleast eight characters long and contain atleast:
                          * One Uppercase Character
                          * One Unique Symbol
                          * One number
                          ''',
                          bold: false,
                        ),
                        Obx(
                          () => CustomPasswordFormField(
                            controller: controller.passwordController,
                            validate: controller.validatePassword,
                            text: 'Password',
                            isVisible: controller.isVisible.value,
                            onPressed: controller.changeVisibility,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () => CustomPasswordFormField(
                            controller: controller.confirmController,
                            validate: controller.validateConfirmPassword,
                            text: 'Confirm Password',
                            isVisible: controller.isConfirmVisible.value,
                            onPressed: controller.changeConfirmVisibility,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: controller.isCheckedAgreement.value,
                                  onChanged: (value) =>
                                      controller.changeAgreement()),
                            ),
                            Row(
                              children: [
                                Text(
                                  'I agree to the ',
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Terms and Conditions',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SubmitButton(
                          text: 'SIGNUP',
                          ontap: () {
                            if (controller.key.currentState!.validate()) {
                              if (controller.isCheckedAgreement.value) {
                                controller.registerNewUser(
                                  email: controller.emailController.text,
                                  password: controller.passwordController.text,
                                );
                              } else {
                                Get.snackbar('AGREEMENT',
                                    'Agree to the Terms and Privacy Policy to continue');
                              }
                            }
                          },
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(
                              size: 12,
                              text: 'Have an account?',
                              bold: false,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const TextWidget(
                                size: 14,
                                text: ' Login Now',
                                bold: false,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
