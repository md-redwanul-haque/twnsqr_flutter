import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';


class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Ensure it stretches to the parent width
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
      padding: const EdgeInsets.only(left: 14, bottom: 14, top: 14),
      // Consistent padding
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
          Row(
            // Center align row contents
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