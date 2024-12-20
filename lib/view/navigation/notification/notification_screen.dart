import 'package:e_validation/models/navigation/notification_list_model.dart';
import 'package:e_validation/view/navigation/notification/widget/notification_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/notification/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../res/assets/font_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: Get.width * Utils.getResponsiveWidth(428),
                height: Get.height * Utils.getResponsiveHeight(365),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageAssets
                        .product_detail_bg), // Replace with your image path
                    fit: BoxFit.cover, // Adjust the image to fill the screen
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.img_notifications,
                      height: Get.height * Utils.getResponsiveHeight(193),
                      width: Get.width * Utils.getResponsiveWidth(235),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'notifications'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: 26,
                          fontFamily: FontAssets.poppins_semi_bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 56),
                  child: FutureBuilder<List<NotificationListModel>>(
                    future: notificationVM
                        .notificationListApi(), // Call your function
                    builder: (context, snapshot) {
                      // if (snapshot.connectionState == ConnectionState.waiting) {
                      //   return Center(
                      //       child:
                      //           CircularProgressIndicator()); // Loading indicator
                      // } else if (snapshot.hasError) {
                      //   return Center(
                      //       child: Text(
                      //           'Error: ${snapshot.error}')); // Error message
                      // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      //   return Center(
                      //       child:
                      //           Text('your_cart_is_empty'.tr)); // Empty state
                      // } else {
                      // final histories = snapshot.data!;

                      return SizedBox(
                        height: 56,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            // final history = histories[index];
                            return NotificationCartWidget();
                          },
                        ),
                      );
                      // }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
