import 'package:e_validation/repository/complaints_repository/complaints_repository.dart';
import 'package:get/get.dart';
import '../../../../data/response/status.dart';
import '../../../../models/navigation/complaints/complaints_list_model.dart';

class ComplaintsViewModel extends GetxController {
  final _api = ComplaintsRepository();

  final rxRequestStatus = Status.LOADING.obs;
  var complaintsDataList = <Data>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setError(String _value) => error.value = _value;

  Future<void> complaintsListApi() async {
    loading.value = true;
    try {
      var result = await _api.complaintsListApi();
      var complaintsHistory = ComplaintsListModel.fromJson(result);
      loading.value = false;
      if (complaintsHistory.isSuccessfull == true &&
          complaintsHistory.data != null) {
        complaintsDataList.assignAll(complaintsHistory.data!);
      } else {
        setError('no_complaints'.tr);
      }
    } catch (e) {
      loading.value = false;
      setError(e.toString());
    }
  }
}
