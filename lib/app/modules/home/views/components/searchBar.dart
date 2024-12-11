import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}