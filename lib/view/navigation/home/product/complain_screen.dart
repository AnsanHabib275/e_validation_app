import 'package:e_validation/data/exceptions/app_exceptions.dart';
import 'package:e_validation/res/assets/font_assets.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/res/colors/app_color.dart';
import 'package:e_validation/view/navigation/home/product/widget/attach_file_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_message_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/input_product_id_widget.dart';
import 'package:e_validation/view/navigation/home/product/widget/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';
import '../../../../view_models/controller/navigation/complain/complain_view_model.dart';

class ComplainScreen extends StatefulWidget {
  const ComplainScreen({super.key});

  @override
  State<ComplainScreen> createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final complaintVM = Get.put(ComplainViewModel());
  final _formkey = GlobalKey<FormState>();

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
                  Image.asset(
                    ImageAssets.img_complain,
                    height: Get.height * Utils.getResponsiveHeight(193),
                    width: Get.width * Utils.getResponsiveWidth(235),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'complain'.tr,
                    style: TextStyle(
                        color: AppColor.textColorPrimary,
                        fontSize: 26,
                        fontFamily: FontAssets.poppins_semi_bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formkey,
                child: Column(children: [
                  InputProductIdWidget(),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(22)),
                  AttachFileWidget(),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(22)),
                  InputMessageWidget()
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SubmitButtonWidget(formkey: _formkey),
            )
          ],
        ),
      ),
    );
  }
}
