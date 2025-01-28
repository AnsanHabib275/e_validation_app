import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/notification/notification_view_model.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class RewardCartWidget extends StatefulWidget {
  // final HistoryListModel history;

  const RewardCartWidget({
    super.key,
    // required this.history,
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
                        '+180',
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
                  'products_scanned'.tr,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.textBlack80Per,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: Get.height * Utils.getResponsiveSize(18)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(14)),
                child: Text(
                  '56',
                  style: TextStyle(
                      color: AppColor.textBlack80Per,
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
