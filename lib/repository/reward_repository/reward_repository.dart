import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/reward_list_model.dart';
import '../../res/urls/app_url.dart';

class RewardRepository {
  final _apiServices = NetworkApiServices();

  Future<List<RewardListModel>> rewardListApi(String uid, String apiKey) async {
    dynamic response = await _apiServices
        .getApi(AppUrl.signupurl + '?uid=' + uid, apiKey: apiKey);
    // return response;
    if (response is List) {
      return response.map((e) => RewardListModel.fromJson(e)).toList();
    } else {
      throw Exception('failed_to_load_products'.tr);
    }
  }

  Future<dynamic> getRewardApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.forgetpass);
    return response;
  }
}
