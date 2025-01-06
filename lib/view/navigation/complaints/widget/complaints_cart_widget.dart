import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../view_models/controller/navigation/history/history_view_model.dart';
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
      height: 60,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'QR code no. 3342567',
                      // widget.history.qrCodeNo,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColor.textBlack80Per),
                    ),
                    Text(
                      'Submitted',
                      // widget.history.scanedOn,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color:
                            AppColor.textBlack80Per, // Strikethrough effect
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                IconAssets.ic_submitted_complaint,
                height: 15,
                width: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
