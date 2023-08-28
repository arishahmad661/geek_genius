import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../../controllers/home_page_controller.dart';
import 'bottom_sheet.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items:
      [0,1, 2, 3, 4, 5,6,7,8,9,10,11,12,].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: InkWell(
                onTap: (){
                  ShowBottomSheet().showBottomSheet(i);
                },
                child: Container(
                  constraints: BoxConstraints(
                    // width: MediaQuery.of(context).size.width-110,//minimum height
                    minWidth: 200, // minimum width
                    maxHeight: 500,
                    maxWidth: 300,
                    //maximum width set to 100% of width
                  ),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(
                        boxShadow:[ BoxShadow(color: Colors.black,offset: Offset(5.0, 5.0),)],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.amber
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                HomePageController().quizNames[i],
                                style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(HomePageController().quizImages[i]),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
