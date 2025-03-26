import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';
import 'package:http/http.dart' as http;

class UpdateProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> updateProfileApi(var data) async {
    dynamic response =
        await _apiServices.postFormDataApi(data, AppUrl.updateProfileUrl);
    return response;
  }

  Future<dynamic> uploadProfileImageApi(
      var data, List<http.MultipartFile> files) async {
    dynamic response = await _apiServices.postFormDataApi(
        data, files: files, AppUrl.uploadProfilePhotoUrl);
    return response;
  }
}
