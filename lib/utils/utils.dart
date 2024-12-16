import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../res/colors/app_color.dart';

class Utils {
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
    double deviceHeight = Get.height; // Get the actual device height
    return figmaHeight / deviceHeight;
  }

  static double getResponsiveWidth(double figmaWidth) {
    double deviceWidth = Get.width; // Get the actual device height
    return figmaWidth / deviceWidth;
  }
}
