import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class SignUpRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> signUpApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signupUrl);
    return response;
  }
}
