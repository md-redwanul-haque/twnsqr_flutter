import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import 'filterChipWidget.dart';

class FilterButtonSection extends StatelessWidget {
  const FilterButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.items,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16),
                child: Image.asset("assets/sliders.png"),
              ),
            ),
            // Filter Chips
            FilterChipWidget(label: "All", selected: true),
            FilterChipWidget(label: "Sports"),
            FilterChipWidget(label: "Food"),
            FilterChipWidget(label: "Kids"),
            FilterChipWidget(label: "Creative"),
            FilterChipWidget(label: "Popular"),
            FilterChipWidget(label: "Calm"),
          ],
        ),
      ),
    );
  }
}