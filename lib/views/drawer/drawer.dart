import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Widget homeDrawer() {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              color: Colors.amber
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                maxRadius: 45,
                child: Image.asset(GetStorage().read('profileImage'),fit: BoxFit.cover,),
              ),
              Text(GetStorage().read('nickname'),style: TextStyle(fontSize: 25),),
            ],
          ),
        ),
        InkWell(
          onTap: (){
            Share.share("Share the newly build app by Arish Ahmad in Code Casa Virtual Internship \n https://github.com/arishahmad661/trivia_quiz");
          },
          child: const ListTile(
            title: Text("Share"),
          ),
        ),
        InkWell(
          onTap: ()async{
            final Uri url = Uri.parse('https://github.com/arishahmad661/trivia_quiz');
            if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
            }
          },
          child: const ListTile(
            title: Text("Checkout Source Code"),
          ),
        ),
        const ListTile(
          title: Text("History"),
        ),
      ],
    ),
  );
}
