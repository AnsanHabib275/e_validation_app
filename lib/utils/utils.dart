import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/colors/app_color.dart';

class Utils {
  static double baseHeight = 926;
  static double baseWidth = 428;
  static double deviceHeight = Get.height;
  static double deviceWidth = Get.width;

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.BOTTOM);
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColor.blackColor,
        gravity: ToastGravity.CENTER);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }

  static double getResponsiveHeight(double figmaHeight) {
    return (figmaHeight / baseHeight);
  }

  static double getResponsiveWidth(double figmaWidth) {
    return (figmaWidth / baseWidth);
  }
}

extension StringExtensions on String {
  String toTitleCase() {
    return this.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
