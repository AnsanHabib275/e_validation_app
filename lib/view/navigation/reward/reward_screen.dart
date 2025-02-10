import 'package:e_validation/view/navigation/reward/widget/reward_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/reward/reward_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/navigation/rewards/reward_list_model.dart';
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
  final List<RewardListModel> rewardsItems = [
    RewardListModel('+180', 'Product Scanned', '56'),
    RewardListModel('+20', 'Complaints', '23'),
    RewardListModel('+40', 'Solved Complaints', '10'),
  ];

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
                image: AssetImage(ImageAssets.product_detail_bg),
                fit: BoxFit.cover,
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
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RewardCartWidget(
                    rewards: rewardsItems[index],
                  );
                },
              ),
              // child: Obx(() {
              //   if (rewardVM.loading.value) {
              //     return const Center(child: CircularProgressIndicator());
              //   }
              //   if (rewardVM.error.isNotEmpty) {
              //     return Center(child: Text(rewardVM.error.value));
              //   }
              //   if (rewardVM.rewardList.isEmpty) {
              //     return Center(child: Text('no_rewards'.tr));
              //   }
              //   return ListView.builder(
              //     itemCount: rewardVM.rewardList.length,
              //     itemBuilder: (context, index) {
              //       return RewardCartWidget(
              //           rewards: rewardVM.rewardList[index]);
              //     },
              //   );
              // }),
            ),
          ),
        ]),
      ),
    );
  }
}
