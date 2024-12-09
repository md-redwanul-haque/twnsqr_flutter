import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services.dart';
import 'create.dart';
import '../presenters/home_controller.dart';
import 'locations.dart';
import 'activities.dart';
import 'profile.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600; // Assuming width > 600 is web layout.

    return Scaffold(
      appBar: isWeb
          ? null // No AppBar for web
          : AppBar(
        title: Text('Section: '),
      ),
      drawer: isWeb
          ? null // Disable the drawer for web
          : Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: const Text('Toggle Theme'),
              onTap: () {
                controller.toggleTheme();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          if (isWeb) NavigationRailSection(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.red,
                  height: 200,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.yellow,
                  height: 200,
                  width: double.infinity,
                ),
                if (!isWeb) CustomBottomNavSection(),
              ],
            ),
          ),
        ],
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
            icon: Icon(Icons.local_activity_outlined),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Locations());
            },
            icon: Icon(Icons.location_city_sharp),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Create());
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Profile());
            },
            icon: Icon(Icons.person_outline_sharp),
          ),
          IconButton(
            onPressed: () {
              Get.to(() => Services());
            },
            icon: Icon(Icons.pages),
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
      color: Color(0xFF111111), // Dark background like the image
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
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
              icon: Icon(Icons.add, color: Colors.white),
              label: Text('Create'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1E88E5), // Match button color
                minimumSize: Size(double.infinity, 48), // Full width button
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
        color: isSelected ? Color(0xFF1E88E5) : Colors.transparent, // Highlight active
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 24),
            SizedBox(width: 16),
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



