import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class NotificationRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> notificationListApi(String eid) async {
    dynamic response = await _apiServices.getApi(AppUrl.loginUrl, eid: eid);
    return response;
  }
}
