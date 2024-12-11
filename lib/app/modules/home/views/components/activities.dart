import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenters/home_controller.dart';

class Activities extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Activities'),
      ),
      body: Center(child: Text("Activities")),
    );

  }
}
