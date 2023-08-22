import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/views/match/option_display_widget.dart';
import '../../controllers/gameplay_screen_controller.dart';

Widget questionCard() {

  final gamePlayScreenController = Get.find<GamePlayScreenController>();

  return Card(
      color: Colors.amber,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${gamePlayScreenController.quesIndex.value +1 }",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Colors.black),
                      borderRadius:
                      BorderRadius.circular(5)),
                  child: const Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.timer, size: 25),
                      Text(
                        "10.0s",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              gamePlayScreenController.quizDataList.value[gamePlayScreenController.quesIndex.value].question
                  .replaceAll("<p>", "\n\n",)
                  .replaceAll("<br>", "\n",)
                  .replaceAll("&quot;", "\"",)
                  .replaceAll("&apos;", "'",)
                  .replaceAll("&lt;", ">",)
                  .replaceAll("&gt;", "<",)
                  .replaceAll("&#033;", "!",)
                  .replaceAll("&#039;", "'",)
                  .trim(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            optionDisplayWidget(gamePlayScreenController.shufflesOptions.value[0]),
            const SizedBox(
              height: 10,
            ),
            optionDisplayWidget(gamePlayScreenController.shufflesOptions.value[1]),
            const SizedBox(
              height: 10,
            ),
            optionDisplayWidget(gamePlayScreenController.shufflesOptions.value[2]),
            const SizedBox(
              height: 10,
            ),
            optionDisplayWidget(gamePlayScreenController.shufflesOptions.value[3]),
          ],
        ),
      ));
}

