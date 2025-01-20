import 'package:e_validation/res/componants/RoundButtonBorder.dart';
import 'package:e_validation/res/routes/routes_name.dart';
import 'package:e_validation/utils/utils.dart';
import 'package:e_validation/view_models/controller/deleteAccount/delete_account_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteButtonWidget extends StatelessWidget {
  DeleteButtonWidget({Key? key, required this.formkey, required this.eid})
      : super(key: key);

  final deleteAccountVM = Get.put(DeleteAccountViewModel());
  final formkey;
  final eid;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        // width: Get.width * Utils.getResponsiveWidth(119),
        height: 42,
        radius: 4,
        fontSize: 16,
        title: 'delete'.tr,
        loading: deleteAccountVM.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            deleteAccountVM.deleteAccountApi(eid);
          }
        },
      );
    });
  }
}
