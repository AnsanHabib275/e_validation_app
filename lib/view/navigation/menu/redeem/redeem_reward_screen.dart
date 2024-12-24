import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/reward_card_grid.dart';
import 'package:e_validation/view/navigation/menu/redeem/widget/section_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RedeemRewardScreen extends StatefulWidget {
  const RedeemRewardScreen({super.key});

  @override
  State<RedeemRewardScreen> createState() => _RedeemRewardScreenState();
}

class _RedeemRewardScreenState extends State<RedeemRewardScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        ImageAssets.img_redeem_reward,
                        height: 193,
                      ),
                      SizedBox(height: 16),
                      Text(
                        Get.height.toString(),
                        // "redeem_your_rewards".tr,
                        style: TextStyle(
                            color: AppColor.textColorPrimary,
                            fontSize: 26,
                            fontFamily: FontAssets.poppins_semi_bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                SectionHeader(title: 'transportation'.tr),
                RewardCardGrid(),
                SizedBox(height: 24),
                SectionHeader(title: 'restaurants'.tr),
                RewardCardGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
