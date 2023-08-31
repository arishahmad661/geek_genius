import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz_app/controllers/user_profile_controller.dart';

class UserProfileBinding implements Bindings{
  @override
  void dependencies() {
    Get.put<UserProfileCtrl>(UserProfileCtrl());
  }
}

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  final userProfileCtrl = UserProfileCtrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(userProfileCtrl.nickname == ""){
            Get.snackbar(
              "Enter nickname",
              "Nickname cannot be empty",
              snackPosition: SnackPosition.BOTTOM,

            );
          }
          else{
            userProfileCtrl.saveProfileData();
            Get.toNamed("/");
          }

        },
        child: Icon(Icons.done),
      ),
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                Get.bottomSheet(
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
                      width: Get.width,
                      height: 200,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(userProfileCtrl.profileImages.length, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 80,
                              child: InkWell(
                                onTap: (){
                                  userProfileCtrl.selectedProfileImage.value = userProfileCtrl.profileImages[index];
                                },
                                  child: Image.asset(userProfileCtrl.profileImages[index])),
                            ),
                          )),
                        ),
                      ),
                    )
                );
              },

              child: Obx(() => CircleAvatar(
                radius: 80,
                child: Image.asset(userProfileCtrl.selectedProfileImage.value),
              ))
            ),
            SizedBox(height: 40,),
            TextField(
              onChanged: (value){
                userProfileCtrl.nickname = value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Eg. Ted",
                labelText: "Enter your nickname!"
              ),
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
