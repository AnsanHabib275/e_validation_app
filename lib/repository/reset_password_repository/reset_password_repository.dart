import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ResetPasswordRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> resetPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.resetPassUrl);
    return response;
  }
}
