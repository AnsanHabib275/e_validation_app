import 'package:e_validation/repository/complaints_repository/complaints_repository.dart';
import 'package:e_validation/repository/history_repository/history_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
import '../../../../models/navigation/history_list_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class ComplaintsViewModel extends GetxController {
  final _api = ComplaintsRepository();

  final rxRequestStatus = Status.LOADING.obs;
  List<ComplaintsListModel> _cartList = [];

  List<ComplaintsListModel> get cartList => _cartList;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setCartList(List<ComplaintsListModel> carts) => _cartList = carts;

  void setError(String _value) => error.value = _value;

  Future<List<ComplaintsListModel>> complaintsListApi() {
    UserPreference userPreference = UserPreference();
    return userPreference.getUser().then((user) {
      return _api
          .complaintsListApi(user.uid!, user.apiKey!)
          .then((historyList) {
        setRxRequestStatus(Status.COMPLETED);
        return historyList;
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        throw Exception('failed_to_fetch_cart_list'.tr);
      });
    });
  }
}
