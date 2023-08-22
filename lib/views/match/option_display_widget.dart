import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/gameplay_screen_controller.dart';

Widget optionDisplayWidget(option) {

  final gamePlayScreenController = Get.find<GamePlayScreenController>();

  return Obx(()  => InkWell(
    onTap: (){
      gamePlayScreenController.isFloatingButtonActive.value = true;
      if(option == gamePlayScreenController.correctOption.value){
        gamePlayScreenController.points.value++;
      }
      if(gamePlayScreenController.selectedOption.value ==""){
        gamePlayScreenController.selectedOption.value = option;
      }
    },
    child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: gamePlayScreenController.selectedOption.value != "" ? (option == gamePlayScreenController.correctOption.value ? Colors.green : (option == gamePlayScreenController.selectedOption.value? Colors.red : Colors.transparent) ) : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border:
            Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            option
                .replaceAll("<p>", "\n\n",)
                .replaceAll("<br>", "\n",)
                .replaceAll("&quot;", "\"",)
                .replaceAll("&apos;", "'",)
                .replaceAll("&lt;", ">",)
                .replaceAll("&gt;", "<",)
                .replaceAll("&#033;", "!",)
                .replaceAll("&#039;", "'",)
                .trim(),
            style: TextStyle(fontSize: 20),
          ),
        )),
  ));
}