import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/notification/notification_view_model.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class ComplaintsCartWidget extends StatefulWidget {
  // final HistoryListModel history;

  const ComplaintsCartWidget({
    super.key,
    // required this.history,
  });

  @override
  State<ComplaintsCartWidget> createState() => _ComplaintsCartWidgetState();
}

class _ComplaintsCartWidgetState extends State<ComplaintsCartWidget> {
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
                            text: 'qr_code_no'.tr,
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
                            text: "3342567", // The number
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: AppColor
                                  .textGreyPrimary, // Normal font weight for the number
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Submitted',
                      // widget.history.scanedOn,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(12),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColor.textGreyPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                IconAssets.ic_submitted_complaint,
                height: Get.height * Utils.getResponsiveHeight(15),
                width: Get.width * Utils.getResponsiveWidth(15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
