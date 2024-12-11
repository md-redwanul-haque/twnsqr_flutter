import 'package:flutter/material.dart';

class Activity {
  final String title;
  final String time;
  final String location;
  final String price;
  final String spotsLeft;
  final String intensity;
  final bool childcare;
  final String buttonLabel;

  Activity({
    required this.title,
    required this.time,
    required this.location,
    required this.price,
    required this.spotsLeft,
    required this.intensity,
    this.childcare = false,
    required this.buttonLabel,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      title: map['title'] as String,
      time: map['time'] as String,
      location: map['location'] as String,
      price: map['price'] as String,
      spotsLeft: map['spotsLeft'] as String,
      intensity: map['intensity'] as String,
      childcare: map['childcare'] ?? false,
      buttonLabel: map['buttonLabel'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'location': location,
      'price': price,
      'spotsLeft': spotsLeft,
      'intensity': intensity,
      'childcare': childcare,
      'buttonLabel': buttonLabel,
    };
  }
}


