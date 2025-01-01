import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../utils/utils.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                8), // Ensure clipping to the border radius
            child: Image.asset(
              ImageAssets.tp_1, // Replace with the path to your SVG file
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Image.asset(
        //   ImageAssets.tp_1,
        //   height: 130,
        //   width: 130,
        // ),
        SizedBox(height: Get.height * Utils.getResponsiveHeight(5)),
        Text(
          "Lorem Ipsum text ever since the 1500s",
          style: TextStyle(fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: Get.height * Utils.getResponsiveHeight(2)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "12,000 VP",
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontFamily: FontAssets.poppins_medium,
                fontSize: 12,
              ),
            ),
            SizedBox(
              width: Get.width * Utils.getResponsiveWidth(5),
            ),

            // ElevatedButton(
            //   onPressed: () {},
            //   child: Text("Redeem"),
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            //     textStyle: TextStyle(fontSize: 6),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
