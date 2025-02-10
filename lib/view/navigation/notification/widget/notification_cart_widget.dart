import 'package:e_validation/models/navigation/notification/notification_list_model.dart';
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
  final NotificationListModel notifications;

  const NotificationCartWidget({
    super.key,
    required this.notifications,
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
                                    .textGreyPrimary, // Make "Complain No" bold
                              ),
                            ),
                            TextSpan(
                              text: widget
                                  .notifications.complaintNo, // The number
                              style: TextStyle(
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: AppColor
                                    .textGreyPrimary, // Normal font weight for the number
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.notifications.status.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color:
                              AppColor.textGreyPrimary, // Strikethrough effect
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  widget.notifications.status == 'Solved'
                      ? IconAssets.ic_solved_complaint
                      : IconAssets.ic_pending_complaint,
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
