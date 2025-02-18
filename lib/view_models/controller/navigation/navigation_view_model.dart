import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/navigation/home/home_screen.dart';

class NavigationViewModel extends GetxController {
  var currentScreen = Rxn<Widget>(HomeScreen());
  RxInt currentIndex = 2.obs;

  void changeScreen(Widget screen) {
    currentScreen.value = screen;
  }
}
