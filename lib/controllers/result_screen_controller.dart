import 'dart:io';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreenController extends GetxController{
  ScreenshotController screenshotController = ScreenshotController();

  void takeScreenShot()async{

    await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((value) async{
      if(value != null){
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(value);

        await Share.shareFiles([imagePath.path]);

      }
    });


  }
}