import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/common/widgets/card/food_card_vertical.dart';
import 'package:wasfati/feature/core/controllers/categories/categories_details.dart';
import 'package:wasfati/utils/constants/sizes.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesDetailsController());
    return Obx(
      () =>
          controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                appBar: AppBar(title: Text(controller.title.value)),
                body: SingleChildScrollView(
                  child: GridView.builder(
                    itemCount: controller.foods.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: MySizes.gridViewSpace,
                      crossAxisSpacing: MySizes.gridViewSpace,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder:
                        (_, index) => FoodCardVertical(
                          id: controller.foods[index].id!,
                          image: controller.foods[index].image!,
                          title: controller.foods[index].title!,
                          categories: controller.foods[index].categories!,
                          ingredients: controller.foods[index].ingredients!,
                          time: controller.foods[index].preparationTime!,
                          instructions: controller.foods[index].instructions!,
                        ),
                  ),
                ),
              ),
    );
  }
}
