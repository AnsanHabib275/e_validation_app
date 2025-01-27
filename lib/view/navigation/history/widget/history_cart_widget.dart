import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../view_models/controller/navigation/history/history_view_model.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class HistoryCartWidget extends StatefulWidget {
  // final HistoryListModel history;

  const HistoryCartWidget({
    super.key,
    // required this.history,
  });

  @override
  State<HistoryCartWidget> createState() => _HistoryCartWidgetState();
}

class _HistoryCartWidgetState extends State<HistoryCartWidget> {
  final historyVM = Get.put(HistoryViewModel());

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'products_with_qr_code_no'.tr,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColor
                              .textBlack80Per, // Make "Complain No" bold
                        ),
                      ),
                      TextSpan(
                        text: "55676", // The number
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColor
                              .textBlack80Per, // Normal font weight for the number
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'scanned_on '.tr,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColor
                              .textBlack80Per, // Make "Complain No" bold
                        ),
                      ),
                      TextSpan(
                        text: '5 oct,2022', // The number
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColor
                              .textBlack80Per, // Normal font weight for the number
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
