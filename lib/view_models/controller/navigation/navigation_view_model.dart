import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/navigation/home/home_screen.dart';

class NavigationViewModel extends GetxController {
  var currentScreen = Rxn<Widget>(HomeScreen());
  RxInt currentIndex = 2.obs;

  // void changeScreen(Widget screen) {
  //   currentScreen.value = screen;
  // }
  dynamic screenArguments;

  // void changeScreen(Widget screen, {dynamic arguments}) {
  //   screenArguments = arguments;
  //   currentScreen.value = screen;
  // }
  void changeScreen(Widget screen, {dynamic arguments}) {
    screenArguments = arguments;
    currentScreen.value = screen;
    update();
  }
}
