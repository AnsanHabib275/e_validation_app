import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class UpdateProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> updateProfileApi(var data) async {
    dynamic response =
        await _apiServices.postApi(data, AppUrl.updateProfileUrl);
    return response;
  }
}
