import 'package:e_validation/view_models/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';
import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ChangePasswordRepository {
  final _apiServices = NetworkApiServices();
  final userVM = Get.put(UserPreference());

  Future<dynamic> changePasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.changePassUrl,
        eid: userVM.user_eid.value);
    return response;
  }
}
