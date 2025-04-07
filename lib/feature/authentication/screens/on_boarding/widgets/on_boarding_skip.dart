import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/feature/authentication/controllers/on_boarding/on_boarding.dart';
import 'package:wasfati/utils/constants/sizes.dart';
import 'package:wasfati/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: DeviceUtils.getAppBarHeight(),
        right: MySizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: Text('skip'.tr),
        ));
  }
}
