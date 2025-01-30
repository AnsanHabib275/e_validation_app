import 'package:e_validation/view/navigation/reward/widget/get_reward_button_widget.dart';
import 'package:e_validation/view/navigation/reward/widget/reward_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/reward/reward_view_model.dart';
import 'package:e_validation/view_models/controller/statusBar/status_bar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/navigation/reward_list_model.dart';
import '../../../res/assets/font_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  final rewardVM = Get.put(RewardViewModel());
  final statusBarVM = Get.put(StatusBarViewModel());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(children: [
          Container(
            width: Get.width * Utils.getResponsiveWidth(428),
            height: Get.height * Utils.getResponsiveHeight(365),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets
                    .product_detail_bg), // Replace with your image path
                fit: BoxFit.cover, // Adjust the image to fill the screen
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * Utils.getResponsiveHeight(87)),
                  child: SvgPicture.asset(
                    ImageAssets.img_reward,
                    height: Get.height * Utils.getResponsiveHeight(193),
                    width: Get.width * Utils.getResponsiveWidth(235),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'rewards'.tr,
                  style: TextStyle(
                      color: AppColor.textColorPrimary,
                      fontSize: Get.height * Utils.getResponsiveSize(26),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(16),
                  vertical: Get.height * Utils.getResponsiveHeight(20)),
              child: FutureBuilder<List<RewardListModel>>(
                future: rewardVM.rewardListApi(), // Call your function
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return Center(
                  //       child:
                  //           CircularProgressIndicator()); // Loading indicator
                  // } else if (snapshot.hasError) {
                  //   return Center(
                  //       child: Text(
                  //           'Error: ${snapshot.error}')); // Error message
                  // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //   return Center(
                  //       child:
                  //           Text('your_cart_is_empty'.tr)); // Empty state
                  // } else {
                  // final histories = snapshot.data!;

                  return SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        // final history = histories[index];
                        return RewardCartWidget();
                      },
                    ),
                  );
                  // }
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
