import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/view_models/controller/navigation/reward/reward_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/componants/RoundButton.dart';

class GetRewardButtonWidget extends StatelessWidget {
  GetRewardButtonWidget({Key? key}) : super(key: key);

  final rewardVM = Get.put(RewardViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        width: double.infinity,
        height: 64,
        title: 'submit'.tr,
        loading: rewardVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.accountCreatedScreen);
          // if (formkey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
