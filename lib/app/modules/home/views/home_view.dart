import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presenters/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final themeController = controller.themeController;

    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text('Theme Toggle${controller.count.value}'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Toggle Theme'),
                onTap: () {
                  controller.toggleTheme();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Text('Hello, GetX!'),
        ),
      );
    });
  }
}
