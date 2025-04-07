import 'package:get/get.dart';

class FoodDetailsController extends GetxController{
  static FoodDetailsController get instance => Get.find();

  // Variables
  RxInt id = 0.obs;
  final image = ''.obs;
  final title = ''.obs;
  final categories = ''.obs;
  final ingredients = ''.obs;
  final time = ''.obs;
  final instructions = ''.obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    // Get Arguments
    id.value = Get.arguments['id'] ?? '';
    image.value = Get.arguments['image'] ?? '';
    title.value = Get.arguments['title'] ?? '';
    categories.value = Get.arguments['categories'] ?? '';
    ingredients.value = Get.arguments['ingredients'] ?? '';
    time.value = Get.arguments['time'] ?? '';
    instructions.value = Get.arguments['instructions'] ?? '';
    super.onInit();
  }
}