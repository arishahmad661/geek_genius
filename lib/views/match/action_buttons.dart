import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/gameplay_screen_controller.dart';

Widget actionButton() {

  final gamePlayScreenController = Get.find<GamePlayScreenController>();

  return Obx(() => FloatingActionButton(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    onPressed: () {

      if(gamePlayScreenController.quesIndex.value == Get.arguments['noOfQues'] -1){
        Get.back();
        Get.toNamed("/resultScreen",arguments: {"points" : gamePlayScreenController.points.value.toString()} );
      }else{
        gamePlayScreenController.isFloatingButtonActive.value = false;
        gamePlayScreenController.quesIndex.value = gamePlayScreenController.quesIndex.value + 1;
        gamePlayScreenController.optionShuffle(gamePlayScreenController.quizDataList);
        gamePlayScreenController.selectedOption.value = "";
      }
    },
    child: gamePlayScreenController.quesIndex.value == Get.arguments['noOfQues'] -1  ?const Icon(Icons.done_all)  : const Icon(Icons.arrow_forward),
  ));
}