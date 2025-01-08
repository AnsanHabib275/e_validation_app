import 'package:e_validation/models/navigation/notification_list_model.dart';
import 'package:e_validation/repository/notification_repository/notification_repository.dart';
import 'package:get/get.dart';

import '../../../../data/response/status.dart';
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

  Future<List<NotificationListModel>> notificationListApi() {
    UserPreference userPreference = UserPreference();
    return userPreference.getUser().then((user) {
      return _api.notificationListApi(user.user!.eID!).then((notificationList) {
        setRxRequestStatus(Status.COMPLETED);
        return notificationList;
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        throw Exception('failed_to_fetch_cart_list'.tr);
      });
    });
  }
}
