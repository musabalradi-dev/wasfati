import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasfati/feature/authentication/controllers/on_boarding/on_boarding.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/constants/sizes.dart';
import 'package:wasfati/utils/device/device_utility.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DeviceUtils.getBottomNavigationBarHeight(),
      right: MySizes.defaultSpace,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: MyColors.primary),
        onPressed: () => OnBoardingController.instance.nextPage(),
        child: Icon(
          Iconsax.arrow_right_3,
          color: Colors.white,
        ),
      ),
    );
  }
}
