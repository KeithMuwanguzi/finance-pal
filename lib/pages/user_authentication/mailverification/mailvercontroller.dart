import 'package:finance_pal/database/controllers/auth_controller.dart';
import 'package:finance_pal/pages/user_authentication/login/login.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  Future<void> sendEmailVerification() async {
    await AuthController.instance.sendEmailVerification();
  }

  void setTimerForAutoRedirect() {}

  void manuallyCheckEmailVerificationStatus() {
    Get.to(() => const LoginPage());
  }
}
