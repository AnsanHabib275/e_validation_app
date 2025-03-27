import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/res/urls/app_url.dart';
import 'package:e_validation/view/navigation/complaints/widget/complaints_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../models/login/login_model.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/navigation/complaints/complaints_view_model.dart';
import '../../../view_models/controller/user_preference/user_preference_view_model.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final complaintsVM = Get.put(ComplaintsViewModel());
  final userVM = Get.put(UserPreference());

  @override
  void initState() {
    super.initState();
    complaintsVM.complaintsListApi();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: Get.height * Utils.getResponsiveHeight(87)),
                    child: SvgPicture.asset(
                      ImageAssets.img_complaints,
                      height: Get.height * Utils.getResponsiveHeight(193),
                      width: Get.width * Utils.getResponsiveWidth(235),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'complaints'.tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: Get.height * Utils.getResponsiveSize(26),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * Utils.getResponsiveHeight(20),
                  left: Get.width * Utils.getResponsiveWidth(20),
                  right: Get.width * Utils.getResponsiveWidth(20)),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: Get.height * Utils.getResponsiveSize(42),
                    backgroundColor: AppColor.lightGreyColor,
                    child: userVM.user_ImageURL.isEmpty
                        ? SvgPicture.asset(
                            ImageAssets
                                .img_profile, // Your default SVG image path
                            fit: BoxFit.cover,
                          )
                        : ClipOval(
                            child: Image.network(
                              AppUrl.baseUrl +
                                  userVM.user_ImageURL
                                      .value, // The selected or updated image path
                              fit: BoxFit.cover,
                              height:
                                  Get.height * Utils.getResponsiveHeight(84),
                              width: Get.width * Utils.getResponsiveWidth(84),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: Get.width * Utils.getResponsiveWidth(12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userVM.user_name.value,
                        style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(20),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColorPrimary),
                      ),
                      Text(userVM.user_email.value,
                          style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColor.textGreyPrimary)),
                    ],
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
                child: Obx(() {
                  if (complaintsVM.loading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (complaintsVM.error.isNotEmpty) {
                    return Center(child: Text(complaintsVM.error.value));
                  }
                  if (complaintsVM.complaintsDataList.isEmpty) {
                    return Center(child: Text('no_complaints'.tr));
                  }

                  return ListView.builder(
                    itemCount: complaintsVM.complaintsDataList.length,
                    itemBuilder: (context, index) {
                      return ComplaintsCartWidget(
                          complaints: complaintsVM.complaintsDataList[index]);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
