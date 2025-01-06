import 'package:e_validation/res/assets/font_assets.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Products with QR code no. 55676',
                  // widget.history.qrCodeNo,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
fontWeight: FontWeight.w500,
                      color: AppColor.textBlack80Per),
                ),
                Text(
                  'scanned on 5 oct,2022',
                  // widget.history.scanedOn,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
fontWeight: FontWeight.w400,
                    color: AppColor.textBlack80Per, // Strikethrough effect
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
