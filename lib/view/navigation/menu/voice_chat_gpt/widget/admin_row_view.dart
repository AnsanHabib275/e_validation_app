import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';

class AdminRowView extends StatelessWidget {
  // final VoiceChatGptModel chat; // Use ChatModel directly

  const AdminRowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height * Utils.getResponsiveHeight(36),
          width: Get.width * Utils.getResponsiveWidth(36),
          decoration: BoxDecoration(
              color: AppColor.underlineTextColor,
              borderRadius: BorderRadius.circular(
                  Get.height * Utils.getResponsiveSize(200))),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImageAssets.img_chat_admin,
            ),
          ),
        ),
        SizedBox(
          width: Get.width * Utils.getResponsiveWidth(9),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(10)),
            margin: EdgeInsets.only(
                bottom: Get.height * Utils.getResponsiveHeight(16)),
            decoration: BoxDecoration(
                color: AppColor.underlineTextColor15Per,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                        Get.height * Utils.getResponsiveSize(6)),
                    bottomLeft: Radius.circular(
                        Get.height * Utils.getResponsiveSize(6)),
                    bottomRight: Radius.circular(
                        Get.height * Utils.getResponsiveSize(6)))),
            child: Text(
              "Its the place where fraud ends.",
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: Get.height * Utils.getResponsiveSize(12),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
