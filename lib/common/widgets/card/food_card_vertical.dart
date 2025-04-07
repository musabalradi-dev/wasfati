import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasfati/common/styles/shadows.dart';
import 'package:wasfati/common/widgets/icons/circular_icon.dart';
import 'package:wasfati/common/widgets/images/rounded_image.dart';
import 'package:wasfati/common/widgets/shapes/rounded_container.dart';
import 'package:wasfati/common/widgets/texts/food_title_text.dart';
import 'package:wasfati/feature/core/controllers/home/home.dart';
import 'package:wasfati/feature/core/screens/details/details.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/constants/sizes.dart';
import 'package:wasfati/utils/helper/helper_functions.dart';

class FoodCardVertical extends StatelessWidget {
  const FoodCardVertical({
    super.key,
    this.id,
    required this.image,
    required this.title,
    this.categories,
    this.ingredients,
    required this.time,
    this.instructions,
  });

  // Variables
  final int? id;
  final String image;
  final String title;
  final String? categories;
  final String? ingredients;
  final String time;
  final String? instructions;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        Get.to(() => FoodDetailsScreen(), arguments: {
          'id': id,
          'image': image,
          'title': title,
          'categories': categories,
          'ingredients': ingredients,
          'time': time,
          'instructions': instructions,
        });
      },
      child: Container(
        width: 180,
        padding: EdgeInsetsDirectional.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalFoodShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkGrey : MyColors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              padding: EdgeInsets.all(MySizes.sm),
              backgroundColor: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  // Image
                  RoundedImage(
                    width: double.infinity,
                    height: 180,
                    imageUrl: image,
                    applyImageRadius: true,
                  ),

                  // Icon Favorites
                  PositionedDirectional(
                    top: 0,
                    start: 0,
                    child: Obx(
                        () => CircularIcon(
                        onPressed: () => controller.toggleFavorite(
                          id.toString(),
                        ),
                        icon: controller.favorites.contains(id.toString()) ? Iconsax.heart5 : Iconsax.heart,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MySizes.spaceBtwItem / 2),
            // Details
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: MySizes.sm,
                end: MySizes.sm,
                bottom: MySizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodTitleText(title: title, smallSize: true),
                  SizedBox(height: MySizes.spaceBtwItem / 2),
                  Row(
                    children: [
                      Icon(
                        Iconsax.clock,
                        color: MyColors.primary,
                        size: MySizes.iconXs,
                      ),
                      SizedBox(width: MySizes.xs),
                      Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextTheme.of(context).labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
