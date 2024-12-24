import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
            color: AppColor.textColorPrimary,
            fontSize: 20,
            fontFamily: FontAssets.poppins_semi_bold),
      ),
    );
  }
}
