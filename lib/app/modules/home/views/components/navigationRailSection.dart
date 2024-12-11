import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../activities.dart';
import '../create.dart';
import '../locations.dart';
import '../services.dart';


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
                minimumSize:
                const Size(double.infinity, 48), // Full width button
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
        color: isSelected ? const Color(0xFF1E88E5) : Colors.transparent,
        // Highlight active
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.grey, size: 24),
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