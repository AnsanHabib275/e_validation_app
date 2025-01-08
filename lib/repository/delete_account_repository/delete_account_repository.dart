import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class DeleteAccountRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> deleteAccountApi(var data, String eid) async {
    dynamic response =
    await _apiServices.postApi(data, AppUrl.deleteUrl, eid: eid);
    return response;
  }
}