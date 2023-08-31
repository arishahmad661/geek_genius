import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

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
        ListTile(
          title: Text("Share"),
        ),
        ListTile(
          title: Text("Review on playstore"),
        ),
        ListTile(
          title: Text(""),
        )
      ],
    ),
  );
}
