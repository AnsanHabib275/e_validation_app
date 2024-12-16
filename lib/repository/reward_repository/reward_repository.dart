import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class RewardRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> getRewardApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.forgetpass);
    return response;
  }
}
