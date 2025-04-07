import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/common/widgets/card/food_card_horizontal.dart';
import 'package:wasfati/feature/core/controllers/categories/categories.dart';
import 'package:wasfati/utils/constants/sizes.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    controller.getCategories();
    return Scaffold(
      appBar: AppBar(title: Text('categories'.tr)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Obx(
                () => ListView.separated(
              itemCount: controller.categories.length,
              shrinkWrap: true,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (_, index) => FoodCardHorizontal(
                image: controller.categories[index].image!,
                title: controller.categories[index].title!,
              ),
              separatorBuilder:
                  (_, index) => SizedBox(height: MySizes.spaceBtwItem),
            ),
          ),
        ),
      ),
    );
  }
}
