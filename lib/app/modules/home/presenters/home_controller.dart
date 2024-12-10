import 'package:get/get.dart';

import '../../../core/themes/theme_controller.dart';

class HomeController extends GetxController {
  final ThemeController themeController = Get.find();


  final List<Map<String, dynamic>> activityList = [
    {
      "title": "Beach Yoga",
      "time": "08:00 (60 min)",
      "location": "La Playa de la Rada",
      "price": "9€",
      "spotsLeft": "8 spots left",
      "intensity": "light",
      "buttonLabel": "Join",
    },
    {
      "title": "Reformer Pilates",
      "time": "09:00 (60 min)",
      "location": "Wellness Studios",
      "price": "15€",
      "spotsLeft": "4 spots left",
      "intensity": "medium",
      "childcare": true,
      "buttonLabel": "Join",
    },
    {
      "title": "5-a-side Football",
      "time": "12:30 (45 min)",
      "location": "Municipal Sports Center",
      "price": "19€",
      "spotsLeft": "0 spots left",
      "intensity": "high",
      "childcare": true,
      "buttonLabel": "Sold Out",
    },
    {
      "title": "Standing Tapas Lunch",
      "time": "13:15 (60 min)",
      "location": "Casa Marina",
      "price": "15€",
      "spotsLeft": "5 spots left",
      "intensity": "low",
      "buttonLabel": "Join",
    },
  ];


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
