import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'activities.dart';
import 'create.dart';
import 'locations.dart';
import 'community.dart';
import 'services.dart';



class CustomBottomNavSection extends StatelessWidget {
  const CustomBottomNavSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(width: 0.05))
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Get.to(() => Activities());
            },
            icon: Image.asset("assets/activities.png"),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Locations());
            },
            icon: Image.asset("assets/location.png"),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Create());
            },
            icon:  Image.asset("assets/plus.png"),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Community());
            },
            icon: Image.asset("assets/community.png"),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Services());
            },
            icon:  Image.asset("assets/service.png"),
          ),
        ],
      ),
    );
  }
}