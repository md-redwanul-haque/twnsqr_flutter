import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services.dart';
import 'create.dart';
import '../presenters/home_controller.dart';
import 'locations.dart';
import 'activities.dart';
import 'profile.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {


      return Scaffold(
        appBar: AppBar(
          title: Text('Section: '),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: const Text('Toggle Theme'),
                onTap: () {
                  controller.toggleTheme();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              height: 200,
              width: double.infinity,
            ),
            Container(
              color: Colors.yellow,
              height: 200,
              width: double.infinity,
            ),
            Container(
              height: 100,
              color: Colors.blue,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      child: IconButton(
                        onPressed: (){
                          Get.to(()=>Activities());
                        },
                        icon: Icon(Icons.local_activity_outlined),
                      )
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        Get.to(()=>Locations());
                      },
                      icon: Icon(Icons.location_city_sharp),
                    )
                  ),
                  Container(
                      child: IconButton(
                        onPressed: (){
                          Get.to(()=>Create());
                        },
                        icon: Icon(Icons.add),
                      )
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){
                        Get.to(()=>Profile());
                      },
                      icon: Icon(Icons.person_outline_sharp),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: (){

                        Get.to(()=>Services());
                      },
                      icon: Icon(Icons.pages),
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      );

  }
}
