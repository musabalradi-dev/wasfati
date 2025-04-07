import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodTitleText extends StatelessWidget {
  const FoodTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(title.tr, style: smallSize ? TextTheme.of(context).labelLarge : TextTheme.of(context).labelSmall, overflow: TextOverflow.ellipsis, maxLines: maxLines, textAlign: textAlign,);
  }
}
