import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/home_page_controller.dart';
import 'package:quiz_app/views/home/quiz_view.dart';

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
      drawer: const Drawer(),
        appBar: AppBar(
          title: Text("Trivia Quiz!!"),
          centerTitle: true,
          actions: const [Icon(Icons.account_circle_sharp),],
        ),
        body: Center(
          child: QuizView(),
        ));
  }
}
