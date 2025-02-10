import 'package:get/get.dart';
import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';
import '../../view_models/controller/user_preference/user_preference_view_model.dart';

class ComplaintsRepository {
  final _apiServices = NetworkApiServices();
  final userVM = Get.put(UserPreference());

  Future<dynamic> complaintsListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.complaintStatusUrl,
        eid: userVM.user_eid.value);
    return response;
  }
}
