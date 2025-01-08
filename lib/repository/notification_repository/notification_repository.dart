import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/history_list_model.dart';
import '../../models/navigation/notification_list_model.dart';
import '../../res/urls/app_url.dart';

class NotificationRepository {
  final _apiServices = NetworkApiServices();

  Future<List<NotificationListModel>> notificationListApi(String eid) async {
    dynamic response =
        await _apiServices.getApi(AppUrl.loginUrl + '?uid=', eid: eid);
    // return response;
    if (response is List) {
      return response.map((e) => NotificationListModel.fromJson(e)).toList();
    } else {
      throw Exception('failed_to_load_products'.tr);
    }
  }
}
