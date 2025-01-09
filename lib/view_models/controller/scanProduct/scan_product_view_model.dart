import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:get/get.dart';

import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ScanProductViewModel extends GetxController {
  final _api = ScanProductRepository();

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void scanProductApi(String? productHash, String eid) {
    loading.value = true;
    Map data = {
      'productHash': productHash,
      'deviceIp': "",
      'deviceIdentity': "",
    };
    _api.scanProductApi(data, eid).then((value) {
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
