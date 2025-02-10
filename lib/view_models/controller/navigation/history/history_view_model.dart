import 'package:e_validation/repository/history_repository/history_repository.dart';
import 'package:get/get.dart';
import '../../../../data/response/status.dart';
import '../../../../models/navigation/history/scan_history_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class HistoryViewModel extends GetxController {
  final _api = HistoryRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  var historyDataList = <Data>[].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;

  Future<void> historyListApi() async {
    loading.value = true;
    try {
      UserPreference userPreference = UserPreference();
      userPreference.getUser().then((user) async {
        var result = await _api.historyListApi(user.user!.eID!);
        var scanHistory = ScanHistoryModel.fromJson(result);
        loading.value = false;
        if (scanHistory.isSuccessfull == true && scanHistory.data != null) {
          historyDataList.assignAll(scanHistory.data!);
        } else {
          setError('no_history'.tr);
        }
      }).onError((error, stackTrace) {
        loading.value = false;
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
      });
    } catch (e) {
      loading.value = false;
      setError(e.toString());
    }
  }
}
