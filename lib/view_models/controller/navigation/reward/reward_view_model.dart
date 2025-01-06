import 'package:e_validation/repository/reward_repository/reward_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
import '../../../../models/navigation/reward_list_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class RewardViewModel extends GetxController {
  final _api = RewardRepository();

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;
  final rxRequestStatus = Status.LOADING.obs;
  List<RewardListModel> _rewardList = [];

  List<RewardListModel> get rewardList => _rewardList;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setRewardList(List<RewardListModel> rewards) => _rewardList = rewards;

  void setError(String _value) => error.value = _value;

  Future<List<RewardListModel>> rewardListApi() {
    UserPreference userPreference = UserPreference();
    return userPreference.getUser().then((user) {
      return _api.rewardListApi(user.uid!, user.apiKey!).then((rewardList) {
        setRxRequestStatus(Status.COMPLETED);
        return rewardList;
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        throw Exception('failed_to_fetch_cart_list'.tr);
      });
    });
  }
// void signUpApi() {
//   loading.value = true;
//   Map data = {
//     'email': emailController.value.text,
//     'password': passwordController.value.text,
//     'first_name': firstNameController.value.text,
//     'last_name': lastNameController.value.text,
//   };
//   _api.signUpApi(data).then((value) {
//     loading.value = false;
//     if (value['errorcode'] == 3083) {
//       errorMessage.value = 'email_already_exists'.tr;
//     } else if (value['errorcode'] == 3084) {
//       errorMessage.value = 'email_verification_failed'.tr;
//     } else if (value['errorcode'] == 3064) {
//       errorMessage.value = 'invalid_email'.tr;
//     } else {
//       // SignUpModel signUpModel = SignUpModel.fromJson(value);
//       // userPreference.saveUser(userModel).then((value) {
//       //   Get.delete<SignUpViewModel>();
//       // }).onError((error, stackTrace) {});
//       // Get.toNamed(RoutesName.otpVerificationScreen, arguments: {
//       //   'email': emailController.value.text,
//       //   'uid': signUpModel.uid
//       // })!
//       //     .then((value) {});
//     }
//   }).onError((error, stackTrace) {
//     loading.value = false;
//     errorMessage.value = error.toString();
//   });
// }
}
