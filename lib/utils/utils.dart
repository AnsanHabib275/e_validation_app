import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
        gravity: ToastGravity.CENTER);
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

  static double getResponsiveSize(double figmaSize) {
    return (figmaSize / baseHeight);
  }

  static String apiFormatDate(String appDate) {
    try {
      DateTime parsedDate = DateTime.parse(appDate);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  static String appFormatDate(String apiDate) {
    try {
      DateTime parsedDate = DateTime.parse(apiDate).toLocal();
      return DateFormat('MM-dd-yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  static String scanFormatDate(String apiDate) {
    try {
      DateTime parsedDate = DateTime.parse(apiDate).toLocal();
      return DateFormat('dd MMM,yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }
}

extension StringExtensions on String {
  String toTitleCase() {
    return split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
