import 'package:e_validation/repository/history_repository/history_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
import '../../../../models/navigation/history/scan_history_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class HistoryViewModel extends GetxController {
  final _api = HistoryRepository();

  final rxRequestStatus = Status.LOADING.obs;
  List<Data> _historyDataList = [];

  List<Data> get historyDataList => _historyDataList;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  final scanHistoryList = <Data>[].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setHistoryList(List<Data> historyData) => _historyDataList = historyData;

  void setError(String _value) => error.value = _value;
  Future<void> historyListApi() async {
    try {
      UserPreference userPreference = UserPreference();
      userPreference.getUser().then((user) async {
        final result = await _api.historyListApi(user.user!.eID!);
        setHistoryList(result);
        // print(result as Iterable<Data>);
        scanHistoryList.assignAll(result);
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      });
    } catch (e) {
      setError(e.toString());
    }
  }

  // Future<ScanHistoryModel> historyListApi() {
  //   UserPreference userPreference = UserPreference();
  //   return userPreference.getUser().then((user) {
  //     return _api.historyListApi(user.user!.eID!).then((historyList) {
  //       setRxRequestStatus(Status.COMPLETED);
  //       setCartList(historyList)
  //       return historyList;
  //     }).onError((error, stackTrace) {
  //       setError(error.toString());
  //       setRxRequestStatus(Status.ERROR);
  //       throw Exception('failed_to_fetch_history_list'.tr);
  //     });
  //   });
  // }
}
