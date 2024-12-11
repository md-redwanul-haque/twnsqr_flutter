import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presenters/home_controller.dart';

class Community extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Community'),
      ),
      body: Center(child: Text("Community")),
    );

  }
}
