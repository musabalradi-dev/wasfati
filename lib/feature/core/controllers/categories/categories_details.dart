import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasfati/common/widgets/error/not_found.dart';
import 'package:wasfati/feature/core/models/food/food.dart';
import 'package:wasfati/utils/dio/dio_helper.dart';

class CategoriesDetailsController extends GetxController {
  // todo: Variables
  final foods = <FoodModel>[].obs;
  final isLoading = true.obs;
  final title = ''.obs;

  void getFoodCategories() {
    try {
      isLoading.value = true;

      DioHelper.getData(
        endpoint: '/food/${title.value}',
      )
          .then((value) {
        if (value.data['status'] == true && value.data['data'] != null) {
          foods.value =
              (value.data['data'] as List)
                  .map((e) => FoodModel.fromJson(e))
                  .toList();
        }
        if(value.statusCode == 404){
          Get.snackbar(
            'error'.tr,
            'somethingWentWrong'.tr,
            backgroundColor: Colors.red.shade600,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            margin: const EdgeInsets.all(10),
            borderRadius: 12,
            icon: const Icon(Icons.error_outline, color: Colors.white),
            shouldIconPulse: true,
            dismissDirection: DismissDirection.horizontal,
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        }
        isLoading.value = false;
      })
          .catchError((error) {
        isLoading.value = false;
        // Show error message
        Get.to(() => const NotFoundScreen());
      });
    } catch (error) {
      isLoading.value = false;
      // Show error message
      Get.snackbar(
        'error'.tr,
        'somethingWentWrong'.tr,
        backgroundColor: Colors.red.shade600,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: const EdgeInsets.all(10),
        borderRadius: 12,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        shouldIconPulse: true,
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // Get the arguments passed from the previous screen
    title.value = Get.arguments['title'] ?? '';
    getFoodCategories();
    super.onInit();
  }
}
