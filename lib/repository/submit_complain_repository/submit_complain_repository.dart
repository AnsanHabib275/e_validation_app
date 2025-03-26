import 'package:http/http.dart' as http;

import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class SubmitComplainRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> submitComplaintApi(
      var data, List<http.MultipartFile> files, String eid) async {
    dynamic response = await _apiServices.postFormDataApi(
        data, files: files, AppUrl.submitComplaintUrl, eid: eid);
    return response;
  }
}
