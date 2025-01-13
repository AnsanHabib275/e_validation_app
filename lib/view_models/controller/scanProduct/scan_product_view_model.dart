import 'package:e_validation/models/scan_data_model.dart';
import 'package:e_validation/repository/scan_product_repository/scan_product_repository.dart';
import 'package:e_validation/view/navigation/home/product/product_verified_screen.dart';
import 'package:e_validation/view_models/controller/navigation/navigation_view_model.dart';
import 'package:get/get.dart';

import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ScanProductViewModel extends GetxController {
  final _api = ScanProductRepository();
  final navigationVM = Get.put(NavigationViewModel());

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  Future<Scanmodel?> scanProductApi(String productHash, String eid) async {
    loading.value = true;
    Map data = {
      'productHash': productHash,
      'deviceIp': "",
      'deviceIdentity': "",
    };
    print(data);
    _api.scanProductApi(data, eid).then((value) {
      loading.value = false;
      print(value);
      bool check = value["IsSuccessfull"];
      if (check) {
        print('Status Code 200 and isSuccessfull is true');

        // return scanmodelFromJson(value);
        navigationVM.changeScreen(ProductVerifiedScreen());
      } else {
        Utils.toastMessage('Fake Product');
        String scanCount = value['ScanCount'] ?? '0';

        String productid = value['ProductId'] ?? '---';
        Get.toNamed(RoutesName.complainScreen, arguments: {
          productHash: productHash.toString(),
          productid: productid,
          scanCount: scanCount,
        });
      }
      // if (value['errorcode'] == 1023) {
      //   errorMessage.value = value['message'];
      // } else if (value['errorcode'] == 3084) {
      //   errorMessage.value = 'email_verification_failed'.tr;
      // } else if (value['errorcode'] == 3064) {
      //   errorMessage.value = 'invalid_email'.tr;
      // } else {
      //   Utils.toastMessage(value['Message']);
      //   Get.toNamed(RoutesName.productDetailScreen);
      // }
    }).onError((error, stackTrace) {
      print(error.toString());
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
