import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/gameplay_screen_controller.dart';

class ResultScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<GamePlayScreenController>(GamePlayScreenController());
  }
}

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final gamePlayScreenController = Get.find<GamePlayScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result Screen!"),
        centerTitle: true,
      ),
        body: Center(child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [BoxShadow(color: Colors.black,offset: Offset(5,5))]
          ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your Score is ${Get.arguments['points']}!", style: TextStyle(fontSize: 25),),
            )))
    );
  }
}
