import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Value from 0 to 1

  const CustomProgressBar({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height *
          Utils.getResponsiveHeight(5), // Adjust the height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AppColor.lightGreyButtonColor, // Background color
      ),
      child: Stack(
        children: [
          Container(
            width: Get.width * Utils.getResponsiveWidth(295) * progress,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColor.colorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
