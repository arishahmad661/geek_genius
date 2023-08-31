import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProfileCtrl extends GetxController{
  UserProfileCtrl(){
    selectedProfileImage.value = GetStorage().read('profileImage') == null ? "assets/profile/a1.jpg" : GetStorage().read('profileImage');
  }
  String nickname = "";
  RxString selectedProfileImage = "".obs;

  List<String> profileImages = [
    "assets/profile/a1.jpg",
    "assets/profile/a2.jpg",
    "assets/profile/a3.jpg",
    "assets/profile/a5.png",
    "assets/profile/a6.png",
  ];

   void saveProfileData(){
     final box = GetStorage();
     box.write('profileImage', '${selectedProfileImage.value}');
     box.write('nickname', '${nickname}');
   }
}