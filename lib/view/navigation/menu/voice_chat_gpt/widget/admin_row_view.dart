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
    Color colorWithOpacity =
        AppColor.underlineTextColor.withOpacity(0.15); // 15% opacity

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const CircleAvatar(
        //   backgroundImage: AssetImage(ImageAssets.img_chat_admin),
        // ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              color: AppColor.underlineTextColor,
              borderRadius: BorderRadius.circular(200)),
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
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: AppColor.underlineTextColor15Per,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            child: const Text(
              "Its the place where fraud ends.",
              style: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
