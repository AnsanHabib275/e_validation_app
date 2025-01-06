import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/history/history_view_model.dart';
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

  late String userId;
  late String apiKey;

  @override
  void initState() {
    super.initState();
    UserPreference userPreference = UserPreference();
    userPreference.getUser().then((user) {
      userId = user.uid!;
      apiKey = user.apiKey!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 88,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 11.0, vertical: 8),
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
                            fontSize: 22),
                      ),
                      Text(
                        'points'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColor.textWhite,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.width * Utils.getResponsiveWidth(16)),
              Expanded(
                child: Text(
                  'products_scanned'.tr,
                  style: TextStyle(
                      color: AppColor.textBlack80Per,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  '56',
                  style: TextStyle(
                      color: AppColor.textBlack80Per,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
