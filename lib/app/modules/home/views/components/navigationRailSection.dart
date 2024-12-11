import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twnsqr_flutter/app/modules/home/views/components/profile.dart';

import '../../../../core/utils/app_colors.dart';
import 'activities.dart';
import 'community.dart';
import 'create.dart';
import 'locations.dart';
import 'notification.dart';
import 'services.dart';


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
           Padding(
            padding: EdgeInsets.only(left: 40,top: 30,bottom: 30,right: 20),
            child:
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "TWN",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "SQR",
                      style: TextStyle(
                        fontSize: 26,

                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),)


          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView(
                children: [
                  _buildSidebarItem(
                    context,
                    label: 'Activities',
                    onTap: () => Get.to(() => Activities()),
                    isSelected: true, assetPath: 'assets/activities.png', // Example selected state
                  ),
                  _buildSidebarItem(
                    context,
                    label: 'Locations',
                    onTap: () => Get.to(() => Locations()),
                    isSelected: false, assetPath: 'assets/location.png',
                  ),
                  _buildSidebarItem(
                    context,
                    label: 'Services',
                    onTap: () => Get.to(() => Services()),
                    isSelected: false, assetPath: 'assets/service.png',
                  ),
                  _buildSidebarItem(
                    context,
                    label: 'Communities',
                    onTap: () => Get.to(() => Community()), // Add navigation logic
                    isSelected: false, assetPath: 'assets/community.png',
                  ),
                  _buildSidebarItem(
                    context,
                    label: 'Notifications',
                    onTap: () => Get.to(() => CusNotification()), // Add navigation logic
                    isSelected: false, assetPath: 'assets/bell.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                      onPressed: () => Get.to(() => Create()),
                      icon: const Icon(Icons.add, color: Colors.black),
                      label: const Text('Create',style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttoncolor, // Match button color
                        minimumSize:
                        const Size(double.infinity, 48), // Full width button
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => Profile()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 12.0),
                      color: Colors.transparent, // Highlight active
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/face.png",
                            height: 30,
                            // Tint color based on selection
                          ),

                          Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),

                          //more-vertical.png
                          Image.asset(
                            "assets/more-vertical.png",
                            height: 30,
                            // Tint color based on selection
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildSidebarItem(
      BuildContext context, {
        required String assetPath, // Asset path for the image
        required String label,
        required VoidCallback onTap,
        required bool isSelected,
      }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        color:  Colors.transparent, // Highlight active
        child: Row(
          children: [
            Image.asset(
              assetPath,
              height: 24, // Set the height of the image
              width: 24,  // Set the width of the image
              color: Colors.white  // Tint color based on selection
            ),
            const SizedBox(width: 24),
            Text(
              label,
              style: TextStyle(
                color:  Colors.white ,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

}