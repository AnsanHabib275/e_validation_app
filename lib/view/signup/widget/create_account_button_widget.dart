import 'package:e_validation/res/routes/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/componants/RoundButton.dart';
import '../../../view_models/controller/signup/sign_up_view_model.dart';

class CreateAccountButtonWidget extends StatelessWidget {
  CreateAccountButtonWidget({Key? key, required this.formkey})
      : super(key: key);

  final formkey;
  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'create_account'.tr,
        loading: signUpVM.loading.value,
        onPress: () {
          // Get.toNamed(RoutesName.accountCreatedScreen);
          if (formkey.currentState!.validate()) {
            signUpVM.signUpApi();
          }
        },
      );
    });
  }
}
