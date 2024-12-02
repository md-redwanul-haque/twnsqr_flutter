import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/themes/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put(ThemeController());
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx((){
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        theme: themeController.currentTheme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}

