import 'package:flutter/material.dart';
import 'package:ecoconnect/common/widgets/buttons/custom_text_button.dart';
import 'package:ecoconnect/features/autentication/controllers/onboarding_controller.dart';
import 'package:ecoconnect/utilities/constants/sizes.dart';
import 'package:ecoconnect/utilities/device_utility/device_utility.dart';

class OnBoardingSkipButton extends StatelessWidget {
  const OnBoardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //
    final controller = OnBoardingController.instance;

    //
    return Positioned(
      top: CDeviceUtility.getAppBarHeight(),
      right: CSizes.defaultSpace,
      child: CustomTextButton(
        onPressed: controller.skipPage,
        text: 'Skip',
      ),
    );
  }
}
