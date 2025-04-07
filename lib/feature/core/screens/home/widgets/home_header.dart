import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/utils/constants/sizes.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MySizes.spaceBtwItem,),
        Text('homeTitle'.tr, style: TextTheme.of(context).headlineMedium,),
        SizedBox(height: MySizes.sm,),
        Text('homeSubTitle'.tr, style: TextTheme.of(context).bodyMedium,),
      ],
    );
  }
}