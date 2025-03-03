import 'package:e_validation/models/navigation/rewards/reward_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/notification/notification_view_model.dart';

class RewardCartWidget extends StatefulWidget {
  final RewardListModel rewards;

  const RewardCartWidget({
    super.key,
    required this.rewards,
  });

  @override
  State<RewardCartWidget> createState() => _RewardCartWidgetState();
}

class _RewardCartWidgetState extends State<RewardCartWidget> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 2,
        shadowColor: AppColor.blackColor.withOpacity(0.03),
        color: AppColor.textColorPrimary7Per,
        child: Padding(
          padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(6)),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets.reward_points_box),
                    // Replace with your image path
                    fit: BoxFit.cover, // Adjust the image to fill the screen
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(10),
                      vertical: Get.height * Utils.getResponsiveHeight(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.rewards.points,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.textWhite,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: Get.height * Utils.getResponsiveSize(22)),
                      ),
                      Text(
                        'points'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.textWhite,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: Get.height * Utils.getResponsiveSize(12)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.width * Utils.getResponsiveWidth(16)),
              Expanded(
                child: Text(
                  widget.rewards.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.textGreyPrimary,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height * Utils.getResponsiveSize(18)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(14)),
                child: Text(
                  widget.rewards.counts,
                  style: TextStyle(
                      color: AppColor.textGreyPrimary,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height * Utils.getResponsiveSize(18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
