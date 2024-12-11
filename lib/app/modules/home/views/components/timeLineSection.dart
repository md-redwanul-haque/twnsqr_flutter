import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenters/home_controller.dart';
import 'activityCard.dart';
import 'dashline.dart';



class TimeLineSection extends StatelessWidget {
  const TimeLineSection({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width *
                0.015), // Reduced horizontal padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today / Tuesday Label Section
            Row(
              children: [
                // Circular Indicator
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    height: 8, // Compact size for indicator
                    width: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow, // Indicator color
                    ),
                  ),
                ),

                // Small space between circle and label
                // Label Text
                 Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Today ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "/ tuesday",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),),
                ),
              ],
            ),
            const SizedBox(height: 4),
            // Minimal space after label

            // Timeline and Activity Cards Section
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline Column
                  Column(
                    children: [
                      // Dashed Line
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: DashedLine(
                            height: double.infinity,
                            dashHeight: 3,
                            // Compact dash size
                            dashWidth: 1.5,
                            // Compact dash width
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  // Small space between timeline and cards

                  // Activity Cards Section
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      // Removed extra padding
                      physics: const ClampingScrollPhysics(),
                      // Prevents overscrolling
                      itemCount:
                      controller.activityList.length,
                      // Use the length of the activities list
                      itemBuilder: (context, index) {
                        final activityItem = controller
                            .activityList[
                        index]; // Get activity data by index
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0),
                          child: ActivityCard(
                            title: activityItem.title,
                            time: activityItem.time,
                            location:
                            activityItem.location,
                            price: activityItem.price,
                            spotsLeft:
                            activityItem.spotsLeft,
                            intensity:
                            activityItem.intensity,
                            childcare:
                            activityItem.childcare ??
                                false,
                            buttonLabel: activityItem.buttonLabel,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}