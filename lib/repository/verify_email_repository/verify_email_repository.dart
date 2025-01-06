import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class VerifyEmailRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> verifyEmailApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.verifyEmailUrl);
    return response;
  }
}
