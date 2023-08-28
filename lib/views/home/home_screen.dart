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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      maxRadius: 45,
                    ),
                    Text("User Name",style: TextStyle(fontSize: 25),),
                  ],
                ),
            ),
            ListTile(
              title: Text("Share"),
            ),
            ListTile(
              title: Text("Review on playstore"),
            ),
            ListTile(
              title: Text("Buy be a coffee"),
            )
          ],
        ),
      ),
        appBar: AppBar(
          title: Text("Trivia Quiz!!"),
          centerTitle: true,
          actions:  [IconButton(
            onPressed: (){

            },
              icon: Icon(Icons.account_circle_sharp,size: 40,)),],
        ),
        body: Center(
          child: QuizView(),
        ));
  }
}
