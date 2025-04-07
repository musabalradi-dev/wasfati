import 'package:get/get.dart';
import 'package:wasfati/feature/core/models/categories/categories.dart';
import 'package:wasfati/utils/dio/dio_helper.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  // Variables
  final categories = <CategoriesModel>[].obs;

  getCategories() async {
    try {
      // todo: Get categories
      DioHelper.getData(endpoint: '/fetch-categories').then((value) {
        if (value.data['status'] == true && value.data['data'] != null) {
          categories.value =
              (value.data['data'] as List)
                  .map((e) => CategoriesModel.fromJson(e))
                  .toList();
        }
      });
    } catch (error) {
      // todo: handle error
    } finally {
      // todo: handle finally
    }
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
