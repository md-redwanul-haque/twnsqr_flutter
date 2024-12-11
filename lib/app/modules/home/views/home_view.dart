import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twnsqr_flutter/app/core/utils/app_colors.dart';
import 'components/ActivityCard.dart';
import 'components/BottomContainer.dart';
import 'components/CenterContainer.dart';
import 'components/FilterChipWidget.dart';
import 'components/TopContainer.dart';
import 'components/customBottomNavSection.dart';
import 'components/dashline.dart';
import 'components/navigationRailSection.dart';
import 'services.dart';
import 'create.dart';
import '../presenters/home_controller.dart';
import 'locations.dart';
import 'activities.dart';
import 'profile.dart';


class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, MMM d').format(now);

    return Scaffold(
      appBar: isWeb
          ? null
          : AppBar(
        backgroundColor: Colors.white,
        title: Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/face.png",
                  height: 30,
                ),
              ),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                //Navigation rail Section for Web
                if (isWeb) const NavigationRailSection(),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isWeb)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.04),
                          child: Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: const Text(
                          "This week in Estepona",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 10),

                      if (!isWeb)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: TopContainer(),
                        ),
                      const SizedBox(height: 10),

                      // Search Bar
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                        child: Card(
                          elevation: 5,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "What do you feel like doing?",
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Filter Buttons
                      Padding(
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
                      ),

                      const SizedBox(height: 16),

                      Expanded(
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
                                  Container(
                                    height: 8, // Compact size for indicator
                                    width: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow, // Indicator color
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  // Small space between circle and label
                                  // Label Text
                                  const Text(
                                    "Today / tuesday",
                                    style: TextStyle(
                                      fontSize: 12, // Compact text size
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
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
                                          child: DashedLine(
                                            height: double.infinity,
                                            dashHeight: 3,
                                            // Compact dash size
                                            dashWidth: 1.5,
                                            // Compact dash width
                                            color: Colors.grey.shade400,
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
                                              title: activityItem["title"],
                                              time: activityItem["time"],
                                              location:
                                                  activityItem["location"],
                                              price: activityItem["price"],
                                              spotsLeft:
                                                  activityItem["spotsLeft"],
                                              intensity:
                                                  activityItem["intensity"],
                                              childcare:
                                                  activityItem["childcare"] ??
                                                      false,
                                              buttonLabel: activityItem[
                                                  "buttonLabel"],
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
                      ),
                    ],
                  ),
                ),

                if (isWeb)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.3,
                            ),
                            child: TopContainer(),
                          ),
                          const SizedBox(height: 20),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.3,
                            ),
                            child: CenterContainer(),
                          ),
                          const SizedBox(height: 20),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.3,
                            ),
                            child: BottomContainer(),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!isWeb) const CustomBottomNavSection(),
        ],
      ),
    );
  }
}













