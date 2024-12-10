import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twnsqr_flutter/app/core/utils/app_colors.dart';
import 'components/dashline.dart';
import 'services.dart';
import 'create.dart';
import '../presenters/home_controller.dart';
import 'locations.dart';
import 'activities.dart';
import 'profile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'components/dashline.dart';
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
                icon: const Icon(Icons.notifications_none_outlined),
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
                if (isWeb) const NavigationRailSection(), // Sidebar for web
                Expanded(
                  flex: 2, // Main middle section
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isWeb)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                          child: Text(
                            formattedDate,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: const Text(
                          "This week in Estepona",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
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
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                        child: Card(
                          elevation: 10,
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
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
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
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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

                      // List with Vertical Timeline and Activity Cards
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.015), // Reduced horizontal padding
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
                                  const SizedBox(width: 4), // Small space between circle and label
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
                              const SizedBox(height: 4), // Minimal space after label

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
                                            dashHeight: 3, // Compact dash size
                                            dashWidth: 1.5, // Compact dash width
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 6), // Small space between timeline and cards

                                    // Activity Cards Section
                                    Expanded(
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero, // Removed extra padding
                                        physics: const ClampingScrollPhysics(), // Prevents overscrolling
                                        itemCount: controller.activityList.length, // Use the length of the activities list
                                        itemBuilder: (context, index) {
                                          final activityItem = controller.activityList[index]; // Get activity data by index
                                          return Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0), // Consistent and minimal spacing
                                            child: ActivityCard(
                                              title: activityItem["title"], // Title from the data
                                              time: activityItem["time"], // Time from the data
                                              location: activityItem["location"], // Location from the data
                                              price: activityItem["price"], // Price from the data
                                              spotsLeft: activityItem["spotsLeft"], // Spots left from the data
                                              intensity: activityItem["intensity"], // Intensity level
                                              childcare: activityItem["childcare"] ?? false, // Optional childcare flag
                                              buttonLabel: activityItem["buttonLabel"], // Join/Sold Out button label
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




class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Ensure it stretches to the parent width
      decoration: BoxDecoration(
        color: AppColors.sec_color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 0.6), // Light shadow below container
            blurRadius: 5.0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14), // Consistent padding
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You're close to your goal!",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            maxLines: 1, // Ensure it remains on one line
            // Gracefully handle overflow
          ),
          SizedBox(
            height: 10,
          ),
          Row(// Center align row contents
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title text on one line

                    const SizedBox(height: 5),
                    const Text(
                      "Join more sport activities to \ncollect more points",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Center(
                              child: Text(
                                'Join now',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            child: Center(
                              child: Text(
                                'My points',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Progress bar on the right
              SizedBox(
                width: 90, // Adjust to match the required size
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        value: 0.62, // Adjust the progress here
                        strokeWidth: 6,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.progressbarColor,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const Text(
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
          )
        ],
      ),
    );
  }
}




class CenterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.centerBox,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SizedBox(height: Get.height*0.06),
          Text(
            "Weekly workshops",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          Text(
            "for kids",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Sign up for early access to weekly activities",
            style: TextStyle(fontSize: 13,color: Colors.black),
          ),
          Text(
            "for your kids full of learning and fun!",
            style: TextStyle(fontSize: 13,color: Colors.black),
          ),
          SizedBox(height: 10,),
          Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6,top: 2,bottom: 2),
                  child: Text('Learn more',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
                  child: Icon(Icons.arrow_circle_right_outlined),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.3, // Same width as others
        minHeight: 340, // Match the height of TopContainer and CenterContainer
      ),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/image.png"), // Background image
            fit: BoxFit.fill, // Ensure the image covers the container
          ),
          borderRadius: BorderRadius.circular(12), // Match corner radius of others
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Add shadow for uniformity
              offset: const Offset(0, 0.6),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Text
              SizedBox(
                height: Get.height*0.02,
              ),
              Text(
                "Popular events near you!",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              // Subtitle Text
              SizedBox(
                height: Get.height*0.14,
              ),
              Text(
                "Unleash the fun! Explore the world of\nexciting events happening near you.",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 20),
              // See More Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the widget
                      borderRadius: BorderRadius.circular(12), // Rounded edges
                    ),
                    child: Row(
                      children: [
                        // Overlapping images on the left
                        SizedBox(
                          width: 90, // Adjust width for the stack of images
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: -12,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/image3.png', // First image
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/image2.png', // Second image
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/image1.png', // Third image
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // "See more" text on the right
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontSize: 16,
                              fontWeight: FontWeight.w500, // Text style similar to the image
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
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

class ActivityCard extends StatelessWidget {
  final String title;
  final String time;
  final String location;
  final String price;
  final String spotsLeft;
  final String intensity;
  final bool childcare;
  final String buttonLabel;

  const ActivityCard({
    Key? key,
    required this.title,
    required this.time,
    required this.location,
    required this.price,
    required this.spotsLeft,
    required this.intensity,
    this.childcare = false,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Price
            Text(
              "$time",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            //$time •
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Time and Location
           Row(
             children: [
               Icon(Icons.location_on_outlined,color: Colors.grey,),
               Text(
                 "$location",
                 style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
               ),

             ],
           ),
            const SizedBox(height: 8),

            // Spots Left and Intensity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  spotsLeft,
                  style: TextStyle(
                    fontSize: 14,
                    color: spotsLeft == "0 spots left" ? Colors.red : Colors.black,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: intensity == "high"
                        ? Colors.orange.shade200
                        : (intensity == "medium"
                        ? Colors.purple.shade200
                        : Colors.blue.shade200),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    intensity,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                if (childcare)
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Chip(
                      label: Text("childcare"),
                      backgroundColor: Colors.greenAccent,
                    ),
                  ),

                if (buttonLabel == "Sold Out")
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Sold Out",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Join",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

              ],
            ),
            const SizedBox(height: 8),

            // Join or Sold Out Button

          ],
        ),
      ),
    );
  }
}

class FilterChipWidget extends StatefulWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    Key? key,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  _FilterChipWidgetState createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected; // Toggle selection
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.selectedItems : AppColors.items,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            widget.label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey.shade600,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}






