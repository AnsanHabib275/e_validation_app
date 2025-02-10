import 'package:e_validation/repository/notification_repository/notification_repository.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
import '../../../../models/navigation/notification/notification_list_model.dart';
import '../../user_preference/user_preference_view_model.dart';

class NotificationViewModel extends GetxController {
  final _api = NotificationRepository();

  final rxRequestStatus = Status.LOADING.obs;
  List<NotificationListModel> _notificationList = [];

  List<NotificationListModel> get notificationList => _notificationList;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setNotificationList(List<NotificationListModel> notifications) =>
      _notificationList = notifications;

  void setError(String _value) => error.value = _value;

  Future<void> notificationListApi() async {
    loading.value = true;
    try {
      UserPreference userPreference = UserPreference();
      userPreference.getUser().then((user) async {
        var result = await _api.notificationListApi(user.user!.eID!);
        loading.value = false;
        setNotificationList(result);
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
