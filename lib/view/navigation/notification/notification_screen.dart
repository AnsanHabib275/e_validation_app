import 'package:e_validation/view/navigation/notification/widget/notification_cart_widget.dart';
import 'package:e_validation/view_models/controller/navigation/notification/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/navigation/notification/notification_list_model.dart';
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
  final List<NotificationListModel> notificationsItems = [
    NotificationListModel('435654', 'Solved'),
    NotificationListModel('435654', 'Pending'),
    NotificationListModel('435654', 'Solved'),
    NotificationListModel('435654', 'Solved'),
    NotificationListModel('435654', 'Solved'),
    NotificationListModel('435654', 'Solved'),
  ];

  @override
  void initState() {
    super.initState();
    notificationVM.notificationListApi();
  }

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
                    image: AssetImage(ImageAssets.product_detail_bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: Get.height * Utils.getResponsiveHeight(87)),
                      child: SvgPicture.asset(
                        ImageAssets.img_notifications,
                        height: Get.height * Utils.getResponsiveHeight(193),
                        width: Get.width * Utils.getResponsiveWidth(235),
                      ),
                    ),
                    SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16)),
                    Text(
                      'notifications'.tr,
                      style: TextStyle(
                          color: AppColor.textColorPrimary,
                          fontSize: Get.height * Utils.getResponsiveSize(26),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Get.width * Utils.getResponsiveWidth(16),
                      right: Get.width * Utils.getResponsiveWidth(16),
                      bottom: Get.height * Utils.getResponsiveHeight(70)),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return NotificationCartWidget(
                          notifications: notificationsItems[index]);
                    },
                  ),
                  // child: Obx(() {
                  //   if (notificationVM.loading.value) {
                  //     return const Center(child: CircularProgressIndicator());
                  //   }
                  //   if (notificationVM.error.isNotEmpty) {
                  //     return Center(child: Text(notificationVM.error.value));
                  //   }
                  //   if (notificationVM.notificationList.isEmpty) {
                  //     return Center(child: Text('no_notification'.tr));
                  //   }
                  //   return ListView.builder(
                  //     itemCount: notificationVM.notificationList.length,
                  //     itemBuilder: (context, index) {
                  //       return NotificationCartWidget(
                  //           notifications: notificationVM.notificationList[index]);
                  //     },
                  //   );
                  // }),
                ),
              ),
            ],
          ),
        ));
  }
}
