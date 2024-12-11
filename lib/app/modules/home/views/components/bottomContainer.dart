import 'package:flutter/material.dart';
import 'package:get/get.dart';



class BottomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth:
        MediaQuery.of(context).size.width * 0.3, // Same width as others
        minHeight: 340, // Match the height of TopContainer and CenterContainer
      ),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/image.png"), // Background image
            fit: BoxFit.fill, // Ensure the image covers the container
          ),
          borderRadius: BorderRadius.circular(12),
          // Match corner radius of others
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
                height: Get.height * 0.02,
              ),
              Text(
                "Popular events near you!",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              // Subtitle Text
              SizedBox(
                height: Get.height * 0.14,
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
                              fontWeight: FontWeight
                                  .w500, // Text style similar to the image
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