import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RewardCard extends StatelessWidget {
  const RewardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // image: DecorationImage(
              //   image: AssetImage(
              //       ImageAssets.splash_bg), // Replace with your asset
              //   fit: BoxFit.cover,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  8), // Ensure clipping to the border radius
              child: SvgPicture.asset(
                ImageAssets.tp_1, // Replace with the path to your SVG file
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Lorem Ipsum text ever since the 1500s",
          style: TextStyle(fontSize: 12),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "12,000 VP",
              style: TextStyle(
                color: AppColor.textColorPrimary,
                fontFamily: FontAssets.poppins_medium,
                fontSize: 12,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Redeem"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                textStyle: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
