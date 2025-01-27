import 'package:e_validation/data/exceptions/app_exceptions.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/view/navigation/complaints/widget/complaints_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../models/navigation/history_list_model.dart';
import '../../../utils/utils.dart';
import '../../../view_models/controller/navigation/complaints/complaints_view_model.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  final complaintsVM = Get.put(ComplaintsViewModel());
  final _formkey = GlobalKey<FormState>();

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
                        color: AppColor.textColorSecondary,
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
                    backgroundImage: AssetImage(ImageAssets.dummy_profile),
                  ),
                  SizedBox(
                    width: Get.width * Utils.getResponsiveWidth(12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'George Oliver',
                        style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(20),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: AppColor.underlineTextColor),
                      ),
                      Text('Georgeoliver@gmail.com',
                          style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColor.textBlack80Per)),
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
                child: FutureBuilder<List<ComplaintsListModel>>(
                  future:
                      complaintsVM.complaintsListApi(), // Call your function
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
                      height: Get.height * Utils.getResponsiveHeight(56),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          // final history = histories[index];
                          return ComplaintsCartWidget();
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
      ),
    );
  }
}
