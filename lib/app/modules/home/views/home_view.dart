import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'components/notification.dart';
import 'components/profile.dart';
import 'components/rightSideBar.dart';
import 'components/topContainer.dart';
import 'components/customBottomNavSection.dart';
import 'components/filterButtonSection.dart';
import 'components/navigationRailSection.dart';
import 'components/searchBar.dart';
import 'components/timeLineSection.dart';
import '../presenters/home_controller.dart';


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
                      onPressed: () => Get.to(() => CusNotification()),
                      icon: const Icon(Icons.notifications_none_outlined),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () => Get.to(() => Profile()),
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
                      if (isWeb)SizedBox(
                        height: 40,
                      ),
                      if (isWeb)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02),
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
                            EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                        child: const Text(
                          "This week in Estepona",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 5),

                      if (!isWeb)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: TopContainer(),
                        ),
                      const SizedBox(height: 5),

                      // Search Bar Section
                      CustomSearchBar(),
                      const SizedBox(height: 10),

                      // Filter Buttons Section
                      FilterButtonSection(),
                      const SizedBox(height: 10),
                      //Timeline Section
                      TimeLineSection(controller: controller),
                    ],
                  ),
                ),
                //Web Right sidebar section
                if (isWeb)
                  RightSideBar(),
              ],
            ),
          ),
          //Custom BottomNav Section for Mobile
          if (!isWeb) const CustomBottomNavSection(),
        ],
      ),
    );
  }
}





















