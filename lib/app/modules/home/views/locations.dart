import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presenters/home_controller.dart';

class Locations extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Section: '),
      ),
      body: Center(child: Text("Profile")),
    );

  }
}
