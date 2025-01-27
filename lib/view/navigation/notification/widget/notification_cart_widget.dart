import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/history/history_view_model.dart';
import '../../../../view_models/controller/navigation/notification/notification_view_model.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class NotificationCartWidget extends StatefulWidget {
  // final HistoryListModel history;

  const NotificationCartWidget({
    super.key,
    // required this.history,
  });

  @override
  State<NotificationCartWidget> createState() => _NotificationCartWidgetState();
}

class _NotificationCartWidgetState extends State<NotificationCartWidget> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * Utils.getResponsiveHeight(56),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Get.height * Utils.getResponsiveHeight(7),
              horizontal: Get.width * Utils.getResponsiveWidth(19)),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'complain_no'.tr,
                              style: TextStyle(
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: AppColor
                                    .textBlack80Per, // Make "Complain No" bold
                              ),
                            ),
                            TextSpan(
                              text: "435654", // The number
                              style: TextStyle(
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: AppColor
                                    .textBlack80Per, // Normal font weight for the number
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Solved',
                        // widget.history.scanedOn,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color:
                              AppColor.textBlack80Per, // Strikethrough effect
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  IconAssets.ic_solved_complaint,
                  height: Get.height * Utils.getResponsiveHeight(28),
                  width: Get.width * Utils.getResponsiveWidth(28),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
