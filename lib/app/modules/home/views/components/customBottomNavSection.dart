import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../activities.dart';
import '../create.dart';
import '../locations.dart';
import '../profile.dart';
import '../services.dart';



class CustomBottomNavSection extends StatelessWidget {
  const CustomBottomNavSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Get.to(() => Activities());
            },
            icon: const Icon(Icons.local_activity_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Locations());
            },
            icon: const Icon(Icons.location_city_sharp),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Create());
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Profile());
            },
            icon: const Icon(Icons.person_outline_sharp),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Services());
            },
            icon: const Icon(Icons.pages),
          ),
        ],
      ),
    );
  }
}