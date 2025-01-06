import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ForgetPasswordRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> forgetPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.forgetPassUrl);
    return response;
  }
}
