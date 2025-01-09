import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:e_validation/repository/submit_complain_repository/submit_complain_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../res/routes/routes_name.dart';
import '../../../../utils/utils.dart';

class SubmitComplainViewModel extends GetxController {
  final _api = SubmitComplainRepository();

  final productIdController = TextEditingController().obs;
  final attachFileController = TextEditingController().obs;
  final messageController = TextEditingController().obs;

  final userNameController = TextEditingController().obs;
  final userLatLngController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final userAddressController = TextEditingController().obs;
  final detailController = TextEditingController().obs;

  final productIdFocusNode = FocusNode().obs;
  final attachFileFocusNode = FocusNode().obs;
  final messageFocusNode = FocusNode().obs;

  final userNameFocusNode = FocusNode().obs;
  final userLatLngFocusNode = FocusNode().obs;
  final titleFocusNode = FocusNode().obs;
  final userAddressFocusNode = FocusNode().obs;
  final detailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void submitComplaintApi(String? productHash, String eid) {
    loading.value = true;
    Map data = {
      'productHash': productHash,
      'deviceIp': "",
      'deviceIdentity': "",
    };
    _api.submitComplaintApi(data, eid).then((value) {
      loading.value = false;
      if (value['errorcode'] == 1023) {
        errorMessage.value = value['message'];
      } else if (value['errorcode'] == 3084) {
        errorMessage.value = 'email_verification_failed'.tr;
      } else if (value['errorcode'] == 3064) {
        errorMessage.value = 'invalid_email'.tr;
      } else {
        Utils.toastMessage(value['Message']);
        Get.toNamed(RoutesName.productDetailScreen);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
