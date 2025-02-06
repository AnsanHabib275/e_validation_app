import 'package:e_validation/repository/history_repository/history_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
import '../../../../models/navigation/history/scan_history_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class HistoryViewModel extends GetxController {
  final _api = HistoryRepository();

  final rxRequestStatus = Status.LOADING.obs;
  List<ScanHistoryModel> _cartList = [];

  List<ScanHistoryModel> get cartList => _cartList;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setCartList(List<ScanHistoryModel> carts) => _cartList = carts;

  void setError(String _value) => error.value = _value;

  Future<List<ScanHistoryModel>> historyListApi() {
    UserPreference userPreference = UserPreference();
    return userPreference.getUser().then((user) {
      return _api.historyListApi(user.user!.eID!).then((historyList) {
        setRxRequestStatus(Status.COMPLETED);
        return historyList;
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        throw Exception('failed_to_fetch_history_list'.tr);
      });
    });
  }
}
