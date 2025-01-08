import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/history_list_model.dart';
import '../../res/urls/app_url.dart';

class ComplaintsRepository {
  final _apiServices = NetworkApiServices();

  Future<List<ComplaintsListModel>> complaintsListApi(String uid) async {
    dynamic response =
        await _apiServices.getApi(AppUrl.complaintStatusUrl + '?uid=' + uid);
    // return response;
    if (response is List) {
      return response.map((e) => ComplaintsListModel.fromJson(e)).toList();
    } else {
      throw Exception('failed_to_load_products'.tr);
    }
  }
}
