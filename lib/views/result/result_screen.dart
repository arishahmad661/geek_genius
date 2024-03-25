import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/controllers/result_screen_controller.dart';
import 'package:screenshot/screenshot.dart';

import '../../controllers/gameplay_screen_controller.dart';

class ResultScreenBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<GamePlayScreenController>(GamePlayScreenController());
    Get.put<ResultScreenController>(ResultScreenController());
  }
}

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final gamePlayScreenController = Get.find<GamePlayScreenController>();
  final resultScreenController = Get.find<ResultScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Column(
            children: [
              Screenshot(
                controller: resultScreenController.screenshotController,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [BoxShadow(color: Colors.black,offset: Offset(5,5))]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Your Score is ${Get.arguments['points']}/${GetStorage().read('maxPoints')}!", style: TextStyle(fontSize: 25),),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(GetStorage().read('quizAsset')),
                        ),
                        Text(GetStorage().read('quizName'),style: const TextStyle(fontSize: 30),),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  )
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: (){
                    resultScreenController.takeScreenShot();
                  },
                  child: const SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Icon(Icons.share_sharp),
                        Text("Share",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        )
    );
  }
}
