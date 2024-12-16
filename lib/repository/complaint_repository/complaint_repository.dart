import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ComplaintRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> complaintApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.forgetpass);
    return response;
  }
}
