import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class HistoryRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> historyListApi(String eid) async {
    dynamic response =
        await _apiServices.getApi(AppUrl.scanHistoryUrl, eid: eid);
    return response;
  }
}
