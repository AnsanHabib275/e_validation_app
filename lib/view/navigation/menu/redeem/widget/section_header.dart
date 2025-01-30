import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width * Utils.getResponsiveWidth(16)),
      child: Text(
        title,
        style: TextStyle(
            color: AppColor.textColorPrimary,
            fontSize: Get.height * Utils.getResponsiveSize(20),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
