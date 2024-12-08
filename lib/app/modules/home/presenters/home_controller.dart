import 'package:get/get.dart';

import '../../../core/themes/theme_controller.dart';

class HomeController extends GetxController {
  final ThemeController themeController = Get.find();

  RxInt index = 0.obs;

  void toggleTheme() {
    themeController.toggleTheme();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
