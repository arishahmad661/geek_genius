import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/controllers/home_page_controller.dart';
import 'package:quiz_app/get_storage/get_storage.dart';

class ShowBottomSheet {
  final homePageController = HomePageController();
  void showBottomSheet(index) {
    Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Customise your quiz!!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 35,
                ),
                const Text("Hom many question ?",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    noOfQuesWidget(5),
                    noOfQuesWidget(10),
                    noOfQuesWidget(20),
                    noOfQuesWidget(25),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text("What should be the level of difficulty ?",
                    style: TextStyle(fontSize: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    difficultyLevelWidget("easy"),
                    difficultyLevelWidget("medium"),
                    difficultyLevelWidget("hard"),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                      GetStorageClass().store(homePageController.quizNames[index].toString(),homePageController.quizImages[index].toString(),homePageController.numberOfQues.value,);
                      Get.toNamed(
                          "/gamePlayScreen",
                          arguments: {
                            "noOfQues": homePageController.numberOfQues.value,
                            "difficulty": homePageController.difficulty.value,
                            "index": homePageController.quizApis[index].toString(),
                            "quizName": homePageController.quizNames[index].toString(),
                          });
                    },
                    child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Text("Start!",
                                  style: TextStyle(fontSize: 25))),
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget difficultyLevelWidget(difficultyLevel) {
    return Obx(() => InkWell(
      onTap: (){
        homePageController.difficulty.value = difficultyLevel;
      },
      child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: homePageController.difficulty.value == difficultyLevel ? Colors.amber : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black)),
                      child:Center(
                          child: Text(
                          difficultyLevel,
                        style: const TextStyle(fontSize: 20),
                      )),
                    ),
    ));
  }

  Widget noOfQuesWidget(noOfQues) {
    return Obx(() => InkWell(
      onTap: (){
        homePageController.numberOfQues.value = noOfQues;
      },
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            color: homePageController.numberOfQues.value ==  noOfQues ? Colors.amber: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
            )),
        child: Center(
            child: Text(
          noOfQues.toString(),
          style: const TextStyle(fontSize: 20, color: Colors.black),
        )),
      ),
    ));
  }
}
