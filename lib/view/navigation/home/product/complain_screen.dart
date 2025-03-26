import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/view/navigation/home/product/widget/attach_file_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_detail_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_message_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_product_id_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_title_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_user_address_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_user_lat_lng_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_user_name_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/submit_button_widget.dart';
import 'package:e_validation/view_models/controller/scanProduct/scan_product_view_model.dart';
import 'package:e_validation/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/submitComplain/submit_complain_view_model.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final _formkey = GlobalKey<FormState>();
  final userVM = Get.put(UserPreference());
  final scanProductVM = Get.put(ScanProductViewModel());
  final submitComplaintVM = Get.put(SubmitComplainViewModel());
  final code = Get.arguments['code'] ?? '';
  final productId = Get.arguments['productId'] ?? '';
  final scanCount = Get.arguments['scanCount'] ?? '';
  final message = Get.arguments['message'] ?? '';

  @override
  void initState() {
    super.initState();
    submitComplaintVM.productIdController.value.text = productId;
    submitComplaintVM.messageController.value.text = message;
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        body: Column(children: [
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
                  child: Image.asset(
                    ImageAssets.img_complain,
                    height: Get.height * Utils.getResponsiveHeight(193),
                    width: Get.width * Utils.getResponsiveWidth(235),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'complain'.tr,
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
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(30)),
              child: SingleChildScrollView(
                child: Column(children: [
                  Form(
                    key: _formkey,
                    child: Column(children: [
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(36)),
                      // InputUserNameWidget(),
                      // SizedBox(
                      //     height: Get.height * Utils.getResponsiveHeight(22)),
                      // InputUserLatLngWidget(),
                      // SizedBox(
                      //     height: Get.height * Utils.getResponsiveHeight(22)),
                      // InputTitleWidget(),
                      // SizedBox(
                      //     height: Get.height * Utils.getResponsiveHeight(22)),
                      // InputUserAddressWidget(),
                      // SizedBox(
                      //     height: Get.height * Utils.getResponsiveHeight(22)),
                      InputProductIdWidget(),
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(22)),
                      // InputDetailWidget(),
                      // SizedBox(
                      //     height: Get.height * Utils.getResponsiveHeight(22)),
                      AttachFileWidget(),
                      SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(22)),
                      InputMessageWidget()
                    ]),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(92),
                  ),
                  SubmitButtonWidget(
                    formkey: _formkey,
                    eid: userVM.user_eid.value,
                    productHash: code,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom + 30,
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
