import 'package:get_storage/get_storage.dart';

class GetStorageClass{
  final box = GetStorage();

  void store(quiz,asset,max){
    box.write('quizName', quiz);
    box.write('quizAsset', asset);
    box.write('maxPoints', max);
  }

  void remove(){
    box.remove('quizName');
    box.remove('quizAsset');
  }
}