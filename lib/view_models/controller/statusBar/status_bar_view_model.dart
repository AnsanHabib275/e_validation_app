import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StatusBarViewModel extends GetxController {
  void setStatusBarColor(Color statusBarColor, Color navigationBarColor,
      {Brightness iconBrightness = Brightness.light}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      statusBarIconBrightness: iconBrightness,
      systemNavigationBarColor: navigationBarColor,
      systemNavigationBarIconBrightness: iconBrightness,
    ));
  }
}
