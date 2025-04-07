import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wasfati/common/widgets/texts/section_heading.dart';
import 'package:wasfati/feature/core/controllers/details/details.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/constants/sizes.dart';

class FoodDetailsScreen extends StatelessWidget {
  const FoodDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text(controller.title.value)),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              // Image
              Image(
                width: double.infinity,
                height: 400.0,
                fit: BoxFit.cover,
                image: NetworkImage(controller.image.value),
              ),

              Padding(
                padding: EdgeInsets.all(MySizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeading(
                      title: 'components',
                      showActionButton: false,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    Text(
                      controller.ingredients.value,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    SectionHeading(title: 'timeFood', showActionButton: false),
                    SizedBox(height: MySizes.spaceBtwItem),
                    Container(
                      padding: EdgeInsets.all(MySizes.sm),
                      decoration: BoxDecoration(
                        color: MyColors.primary,
                        borderRadius: BorderRadius.circular(MySizes.sm),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'time'.tr,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(color: MyColors.white),
                          ),
                          SizedBox(width: MySizes.sm),
                          Text(
                            controller.time.value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextTheme.of(
                              context,
                            ).bodyMedium!.apply(color: MyColors.white),
                          ),
                          SizedBox(width: MySizes.xs),
                          Icon(
                            Iconsax.clock,
                            color: MyColors.white,
                            size: MySizes.iconSm,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    SectionHeading(
                      title: 'cookingMethod',
                      showActionButton: false,
                    ),
                    SizedBox(height: MySizes.spaceBtwItem),
                    Text(
                      controller.instructions.value,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
