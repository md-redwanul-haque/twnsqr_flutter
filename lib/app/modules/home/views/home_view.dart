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
                  flex: 2, // Main middle section
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: const Text(
                          "Tues, Nov 12",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: const Text(
                          "This week in Estepona",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Search Bar
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "What do you feel like doing?",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade200,
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
                          padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Vertical Timeline
                              Column(
                                children: [
                                  // Circular Indicator
                                  Container(
                                    height: 16,
                                    width: 16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.yellow, // Indicator color
                                    ),
                                  ),
                                  // Dotted Line
                                  Expanded(
                                    child: Container(
                                      width: 2,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                            color: Colors.grey.shade400,
                                            width: 1.5,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 16), // Space between timeline and cards

                              // Activity Cards
                              Expanded(
                                child: ListView(
                                  children: [
                                    ActivityCard(
                                      title: "Beach Yoga",
                                      time: "08:00 (60 min)",
                                      location: "La Playa de la Rada",
                                      price: "9€",
                                      spotsLeft: "8 spots left",
                                      intensity: "light",
                                      buttonLabel: "Join",
                                    ),
                                    ActivityCard(
                                      title: "Reformer Pilates",
                                      time: "09:00 (60 min)",
                                      location: "Wellness Studios",
                                      price: "15€",
                                      spotsLeft: "4 spots left",
                                      intensity: "medium",
                                      childcare: true,
                                      buttonLabel: "Join",
                                    ),
                                    ActivityCard(
                                      title: "5-a-side Football",
                                      time: "12:30 (45 min)",
                                      location: "Municipal Sports Center",
                                      price: "19€",
                                      spotsLeft: "0 spots left",
                                      intensity: "high",
                                      childcare: true,
                                      buttonLabel: "Sold Out",
                                    ),
                                    ActivityCard(
                                      title: "Standing Tapas Lunch",
                                      time: "13:15 (60 min)",
                                      location: "Casa Marina",
                                      price: "15€",
                                      spotsLeft: "5 spots left",
                                      intensity: "low",
                                      buttonLabel: "Join",
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
                    flex: 1, // Sidebar takes one part
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.3, // Responsive width
                          ),
                          child: TopContainer(),
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: CenterContainer(),
                        ),
                        const SizedBox(height: 10),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: BottomContainer(),
                        ),
                      ],
                    ),
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
      padding: const EdgeInsets.all(14), // Consistent padding
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "You're close to your goal!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Join more sport activities to collect more points",
                  style: TextStyle(fontSize: 12,color: Colors.black),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 4),
                          child: Center(
                            child: const Text(
                              'Join now',
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 4),
                          child: Center(
                            child: const Text(
                              'My points',
                              style: TextStyle(fontSize: 13, color: Colors.white),
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
          const SizedBox(width: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox.square(
                dimension: 70, // Fixed size for the progress circle
                child: CircularProgressIndicator(
                  value: 0.62, // Adjust the progress here
                  strokeWidth: 6,
                  valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.progressbarColor),
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          Text(
            "for kids",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Sign up for early access to weekly activities",
            style: TextStyle(fontSize: 12,color: Colors.black),
          ),
          Text(
            "for your kids full of learning and fun!",
            style: TextStyle(fontSize: 12,color: Colors.black),
          ),
          SizedBox(height: 5,),
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
                  child: Text('Learn more',style: TextStyle(fontSize: 15,color: Colors.black),),
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
        minHeight: 350, // Match the height of TopContainer and CenterContainer
      ),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/bottom_image.png"), // Background image
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
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Price
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
          Text(
            "$time • $location",
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),

          // Spots Left and Intensity
          Row(
            children: [
              Text(
                spotsLeft,
                style: TextStyle(
                  fontSize: 14,
                  color: spotsLeft == "0 spots left" ? Colors.red : Colors.black,
                ),
              ),
              const SizedBox(width: 8),
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
            ],
          ),
          const SizedBox(height: 8),

          // Join or Sold Out Button
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
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool selected;

  const FilterChipWidget({
    Key? key,
    required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.purple.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.black : Colors.grey.shade600,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}




