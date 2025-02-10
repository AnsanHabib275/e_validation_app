import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/navigation/home/home_screen.dart';

class NavigationViewModel extends GetxController {
  var currentScreen = Rxn<Widget>(HomeScreen());
  RxMap<String, dynamic> arguments = <String, dynamic>{}.obs;

  void changeScreen(Widget screen) {
    currentScreen.value = screen;
  }

  void changeScreenWithArguments(Widget screen, Map<String, dynamic> args) {
    currentScreen.value = screen;
    arguments.value = args;
  }
}
