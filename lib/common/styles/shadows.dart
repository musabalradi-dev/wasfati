import 'package:flutter/cupertino.dart';
import 'package:wasfati/utils/constants/colors.dart';

class ShadowStyle{
  ShadowStyle._();

  static final verticalFoodShadow = BoxShadow(
    color: MyColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

  static final horizontalFoodShadow = BoxShadow(
    color: MyColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

}