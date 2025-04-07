import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasfati/feature/core/models/food/food.dart';
import 'package:wasfati/utils/dio/dio_helper.dart';

class HomeController extends GetxController{
  static HomeController get instance => Get.find();

  // Variable
  final isLoading = true.obs;
  final foods = <FoodModel>[].obs;

  // final isFavorites = false.obs;
  final _favorites = <String>[].obs;
  final deviceStorage = GetStorage();

  List<String> get favorites => _favorites;

  // Function to get the favorites list
  List<String> getFavorites() {
    return _favorites;
  }

  // Functions Fetch Data From API
  fetchFoods() async {
    try {
      DioHelper.getData(endpoint: '/fetch-food')
          .then((value) {
        if (value.data['status'] == true && value.data['data'] != null) {
          foods.value =
              (value.data['data'] as List)
                  .map((e) => FoodModel.fromJson(e))
                  .toList();
          isLoading.value = false;
        }else{
          // todo: Handle Error
          Get.snackbar(
            'warning'.tr,
            'somethingWentWrong'.tr,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange,
            colorText: Colors.white,
          );
        }
      })
          .catchError((error) {
        // todo: Is Loading Stop
        isLoading.value = false;
        // todo: Handle Error
        Get.snackbar(
          'error'.tr,
          'somethingWentWrong'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      });
    } catch (error) {
      // todo: Is Loading Stop
      isLoading.value = false;

      // todo: Handle Error
      Get.snackbar(
        'error'.tr,
        'somethingWentWrong'.tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      // todo: Is Loading Stop
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    fetchFoods();
    super.onInit();
    // Load favorites from storage when controller initializes
    final storedFavorites = deviceStorage.read<List>('favorites');
    if (storedFavorites != null) {
      _favorites.assignAll(storedFavorites.cast<String>());
    }

    // Listen to changes in favorites and save to storage
    ever(_favorites, (List<String> value) {
      deviceStorage.write('favorites', value);
    });
  }

  bool isFavorite(String id) {
    return _favorites.contains(id);
  }

  void toggleFavorite(String id) {
    if (_favorites.contains(id)) {
      _favorites.remove(id);
    } else {
      _favorites.add(id);
    }
    // Save the updated favorites list to storage
    _favorites.refresh();
  }
}