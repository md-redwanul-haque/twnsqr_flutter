import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twnsqr_flutter/app/core/utils/app_colors.dart';
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
    final isWeb = MediaQuery.of(context).size.width > 600; // Assuming width > 600 is web layout.
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEE, MMM d').format(now);
    return Scaffold(
      appBar: isWeb
          ? null // No AppBar for web
          : AppBar(
        title: Text(
          formattedDate,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey, // Matches the color shown in the example
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_outlined)),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/face.png",
                    height: 30,
                  )),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (isWeb) const NavigationRailSection(), // Sidebar for web
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "This week in Estepona",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!isWeb) TopContainer(), // TopContainer at the top for mobile
                      Expanded(
                        child: Container(
                          color: Colors.white, // Replace with your main content
                          child: const Center(
                            child: Text("Main Content Here"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isWeb) // Show TopContainer in the right sidebar for web
                  SizedBox(
                    width: 400, // Adjust width to fit the design
                    child: TopContainer(),
                  ),
              ],
            ),
          ),
          if (!isWeb) const CustomBottomNavSection(), // Show bottom navigation for mobile
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height: 250,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.sec_color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.6), //(x,y)
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 14, top: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You're close to your goal!",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "join more sport activities to collect more points",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(5)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text('Join mow',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white)),
                              )),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(5)),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  'My points',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox.square(
                            dimension: 70,
                            child: CircularProgressIndicator(
                              value: 0.62,
                              // Adjust the progress here
                              strokeWidth: 6,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                      AppColors.progressbarColor),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Text(
                            '27',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

class NavigationRailSection extends StatelessWidget {
  const NavigationRailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250, // Adjust width to match design
      color: const Color(0xFF111111), // Dark background like the image
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'TWNSQR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSidebarItem(
                  context,
                  icon: Icons.local_activity_outlined,
                  label: 'Activities',
                  onTap: () => Get.to(() => Activities()),
                  isSelected: true, // Example selected state
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.location_city_sharp,
                  label: 'Locations',
                  onTap: () => Get.to(() => Locations()),
                  isSelected: false,
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.pages,
                  label: 'Services',
                  onTap: () => Get.to(() => Services()),
                  isSelected: false,
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.group,
                  label: 'Communities',
                  onTap: () {}, // Add navigation logic
                  isSelected: false,
                ),
                _buildSidebarItem(
                  context,
                  icon: Icons.notifications_outlined,
                  label: 'Notifications',
                  onTap: () {}, // Add navigation logic
                  isSelected: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton.icon(
              onPressed: () => Get.to(() => Create()),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E88E5), // Match button color
                minimumSize: const Size(double.infinity, 48), // Full width button
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
        required bool isSelected,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        color: isSelected ? const Color(0xFF1E88E5) : Colors.transparent, // Highlight active
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



