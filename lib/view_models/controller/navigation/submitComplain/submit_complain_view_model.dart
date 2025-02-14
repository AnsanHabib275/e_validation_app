import 'package:e_validation/repository/submit_complain_repository/submit_complain_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../view/navigation/home/product/product_verify_done_screen.dart';
import '../navigation_view_model.dart';

class SubmitComplainViewModel extends GetxController {
  final _api = SubmitComplainRepository();
  final navigationVM = Get.put(NavigationViewModel());

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
  RxString imagePath = ''.obs;

  void submitComplaintApi(String productHash, String eid) {
    loading.value = true;
    Map data = {
      'Detail': messageController.value.text,
      'ProductId': productIdController.value.text,
      'QRCodeHash': productHash,
      'ComplaintImage': attachFileController.value.text,
    };
    _api.submitComplaintApi(data, eid).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        navigationVM.changeScreen(ProductVerifyDoneScreen());
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }

  Future getImageFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
      attachFileController.value.text = image.path.toString();
    }
  }

  Future takeImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path.toString();
      attachFileController.value.text = image.path.toString();
    }
  }
}
