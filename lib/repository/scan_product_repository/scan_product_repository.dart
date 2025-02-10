import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ScanProductRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> scanProductApi(var data, String eid) async {
    dynamic response =
        await _apiServices.postApi(data, AppUrl.scanProductUrl, eid: eid);
    return response;
  }
}
