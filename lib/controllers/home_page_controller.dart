import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/model/quiz_data.dart';

class HomePageController extends GetxController{

  RxInt numberOfQues = 10.obs;
  RxString difficulty = "medium".obs;
  Rx<QuizData> ?quizData;

  List quizNames = [
    "Anime & Manga",
    "Cartoon & Animation",
    "Comics",
    "Science Gadgets",
    "Computers",
    "Mathematics",
    "General Knowledge",
    "Vehicles",
    "Sports",
    "Books",
    "Film",
    "Music",
    "Television",
  ];
  List quizImages = [
    "assets/anime&manga.png",
    "assets/cartoon.png",
    "assets/comics.png",
    "assets/science.png",
    "assets/computer.png",
    "assets/maths.png",
    "assets/gk.png",
    "assets/vehicles.png",
    "assets/sports.png",
    "assets/books.png",
    "assets/film.png",
    "assets/music.png",
    "assets/tv.png",
  ];
  List quizApis = [
    31,
    32,
    29,
    30,
    18,
    19,
    9,
    28,
    21,
    10,
    11,
    12,
    14
  ];

}