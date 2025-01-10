import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:e_validation/res/assets/image_assets.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';

class UserRowView extends StatelessWidget {
  // final VoiceChatGptModel chat; // Use ChatModel directly

  const UserRowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CircleAvatar(
        //   backgroundImage: AssetImage(ImageAssets.img_chat_user),
        // ),
        Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
              color: AppColor.lightGreyButtonColor,
              borderRadius: BorderRadius.circular(200)),
          child: Image.asset(ImageAssets.img_chat_user),
        ),
        SizedBox(
          width: Get.width * Utils.getResponsiveWidth(9),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6),
                    bottomRight: Radius.circular(6))),
            child: const Text(
              "What is E-Validation?",
              style: TextStyle(
                  color: AppColor.textBlack,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
