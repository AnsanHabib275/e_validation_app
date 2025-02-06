import 'package:e_validation/models/navigation/history/scan_history_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/history_list_model.dart';
import '../../res/urls/app_url.dart';

class HistoryRepository {
  final _apiServices = NetworkApiServices();

  Future<List<ScanHistoryModel>> historyListApi(String eid) async {
    try {
      dynamic response =
          await _apiServices.getApi(AppUrl.scanHistoryUrl, eid: eid);
      // return response;
      if (response == null || (response is List && response.isEmpty)) {
        return []; // Return an empty list to avoid errors
      }
      if (response is List) {
        return response.map((e) => ScanHistoryModel.fromJson(e)).toList();
      } else {
        throw Exception('failed_to_load_history'.tr);
      }
    } catch (e) {
      print("Error fetching scan history: $e");
      return []; // Return empty list in case of an exception
    }
  }
}
