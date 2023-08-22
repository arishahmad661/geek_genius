import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/gameplay_screen_controller.dart';
import 'package:quiz_app/views/match/action_buttons.dart';
import 'package:quiz_app/views/match/question_card.dart';

import 'gameplay_page_image.dart';

class GamePlayScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GamePlayScreenController>(GamePlayScreenController());
  }
}

class GamePlayScreen extends StatelessWidget {
  GamePlayScreen({super.key});

  final gamePlayScreenController = Get.find<GamePlayScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  Obx(() => gamePlayScreenController.isFloatingButtonActive.value ? actionButton() : SizedBox()) ,
      appBar: AppBar(
        title: Text(
          "${Get.arguments['quizName']} Trivia",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: gamePlayScreenController.getQuizData(Get.arguments['noOfQues'], Get.arguments['difficulty'], Get.arguments['index']),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError){
                return const Center(child: Text("Some Error Occured! \nCheck your internet connection and try again!"));
              }else{
                return Obx(() => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        gamePageImage(),
                        questionCard(),
                        const SizedBox(height: 30,),

                      ],
                    ),
                  ),
                ));
              }
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }






}
