import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/history_list_model.dart';
import '../../res/urls/app_url.dart';

class HistoryRepository {
  final _apiServices = NetworkApiServices();

  Future<List<ComplaintsListModel>> historyListApi(String eid) async {
    dynamic response =
        await _apiServices.getApi(AppUrl.scanHistoryUrl, eid: eid);
    // return response;
    if (response is List) {
      return response.map((e) => ComplaintsListModel.fromJson(e)).toList();
    } else {
      throw Exception('failed_to_load_products'.tr);
    }
  }
}
