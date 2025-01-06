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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageAssets.img_complaints,
                    height: Get.height * Utils.getResponsiveHeight(193),
                    width: Get.width * Utils.getResponsiveWidth(235),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'complaints'.tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 26,
                        fontFamily: 'Poppins',
fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 42,
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
                            fontSize: 20,
                            fontFamily: 'Poppins',
fontWeight: FontWeight.w600,
                            color: Color(0xFF00005A)),
                      ),
                      Text('Georgeoliver@gmail.com',
                          style: TextStyle(
                              fontSize: 16,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                      height: 60,
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
