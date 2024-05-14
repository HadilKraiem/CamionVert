import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecoconnect/common/widgets/success_screen.dart';
import 'package:ecoconnect/data/repositories/autentication/authrepository.dart';
import 'package:ecoconnect/features/autentication/views/sign_in/sign_in.dart';
import 'package:ecoconnect/utilities/constants/images_texts.dart';
import 'package:ecoconnect/utilities/constants/texts.dart';
import 'package:ecoconnect/utilities/snackbars/custom_snackbars.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send email whenevr verify screen appears and set timer for auto-redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  ///send email verification function
  void sendEmailVerification() async {
    try {
      await AuthRepository.instance.sendEmailVerification();
      CustomSnackBars.showSuccessSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email');
    } catch (e) {
      CustomSnackBars.showErrorSnackBar(
          title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => CustomSuccessScreen(
            imageUrl: CImages.successfullyRegistrationAnimation,
            title: CTexts.yourAccountCreatedTitle,
            subtitle: CTexts.yourAccountCreatedSubTitle,
            onPressed: () => Get.offAll(() => const SignInView()),
          ),
        );
      }
    });
  }

  ///Manually check if email is verified
  void checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.to(
        () => CustomSuccessScreen(
          imageUrl: CImages.successfullyRegistrationAnimation,
          title: CTexts.yourAccountCreatedTitle,
          subtitle: CTexts.yourAccountCreatedSubTitle,
          onPressed: () => Get.offAll(() => const SignInView()),
        ),
      );
    }
  }
}
