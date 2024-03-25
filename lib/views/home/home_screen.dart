import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/home_page_controller.dart';
import 'package:quiz_app/views/home/quiz_view.dart';

import '../drawer/drawer.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomePageController>(HomePageController());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: homeDrawer(),
        appBar: AppBar(
          title: const Text("Geek Genius"),
          centerTitle: true,
          actions:  [IconButton(
            onPressed: (){
              Get.toNamed("/userProfile");
            },
              icon: const Icon(Icons.account_circle_sharp,size: 40,)),],
        ),
        body: const Center(
          child: QuizView(),
        ));
  }


}
