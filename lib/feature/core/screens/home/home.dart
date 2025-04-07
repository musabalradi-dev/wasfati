import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/common/styles/spacing_styles.dart';
import 'package:wasfati/common/widgets/card/food_card_vertical.dart';
import 'package:wasfati/common/widgets/images/rounded_image.dart';
import 'package:wasfati/common/widgets/shapes/rounded_container.dart';
import 'package:wasfati/common/widgets/texts/section_heading.dart';
import 'package:wasfati/feature/core/controllers/home/home.dart';
import 'package:wasfati/feature/core/screens/home/widgets/home_header.dart';
import 'package:wasfati/utils/constants/colors.dart';
import 'package:wasfati/utils/constants/sizes.dart';
import 'package:wasfati/utils/helper/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Obx(
        () =>
            controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Padding(
                    padding: SpacingStyles.paddingWithAppBarHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        HomeHeaderWidget(),
                        SizedBox(height: MySizes.spaceBtwSection),

                        // Banner
                        RoundedContainer(
                          width: double.infinity,
                          height: 200,
                          backgroundColor:
                              dark ? MyColors.dark : MyColors.light,
                          child: RoundedImage(
                            isNetworkImage: false,
                            imageUrl:
                                'assets/images/banner/banner.jpg',
                          ),
                        ),
                        SizedBox(height: MySizes.spaceBtwSection),
                        // List
                        SectionHeading(
                          title: 'foodMenu',
                          showActionButton: false,
                        ),
                        SizedBox(height: MySizes.spaceBtwItem),
                        GridView.builder(
                          itemCount: controller.foods.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                ingredients:
                                    controller.foods[index].ingredients!,
                                time: controller.foods[index].preparationTime!,
                                instructions:
                                    controller.foods[index].instructions!,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
