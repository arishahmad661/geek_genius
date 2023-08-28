import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:timer_count_down/timer_controller.dart';
import '../model/quiz_data.dart';


class GamePlayScreenController extends GetxController{
  final CountdownController controller = new CountdownController(autoStart: true);
  void restartCounter(){
    controller.restart();
  }
  void pauseCounter(){
    controller.pause();
  }
  RxList quizDataList = [].obs;
  RxInt quesIndex = 0.obs;
  RxList shufflesOptions = [].obs;
  RxString correctOption = "".obs;
  RxInt points = 0.obs;
  RxString selectedOption = "".obs;
  RxBool isFloatingButtonActive = false.obs;

  Future getQuizData(noOfQues,difficulty,index)async{

    String quizApisUrl = await "https://opentdb.com/api.php?amount=${noOfQues}&category=${index}&difficulty=${difficulty}&type=multiple";
    var url =Uri.parse(quizApisUrl);
    var response = await http.get(url);
    var body = jsonDecode(response.body);

    quizDataList.value = QuizData.fromJson(body).results!;
    optionShuffle(quizDataList);

  }

  void optionShuffle(quizDataList){

    correctOption.value = quizDataList.value[quesIndex.value].correctAnswer;
    shufflesOptions.value = quizDataList.value[quesIndex.value].incorrectAnswers;

    var n = Random().nextInt(3);
    shufflesOptions.insert(n,correctOption.value);

  }




}