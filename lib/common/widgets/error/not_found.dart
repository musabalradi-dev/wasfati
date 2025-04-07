import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/navigation_menu.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/constants/sizes.dart';
import 'package:wasfati/utils/helper/helper_functions.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Image(
              image: const AssetImage('assets/images/error/No-data-pana.png'),
              width: HelperFunctions.screenWidth() * 2,
              fit: BoxFit.cover,
            ),
            Text(
              'noData'.tr,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: MySizes.spaceBtwItem),
            TextButton(
              onPressed: () => Get.offAll(() => NavigationMenu()),
              child: Text(
                'back'.tr,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: MyColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
