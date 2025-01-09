import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class SubmitComplainRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> submitComplaintApi(var data,String eid) async {
    dynamic response =
        await _apiServices.postApi(data, AppUrl.submitComplaintUrl,eid: eid);
    return response;
  }
}
