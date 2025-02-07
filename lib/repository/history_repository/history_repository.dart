import 'package:e_validation/models/navigation/history/scan_history_model.dart';
import 'package:get/get.dart';

import '../../data/network/network_api_services.dart';
import '../../models/navigation/history_list_model.dart';
import '../../res/urls/app_url.dart';

class HistoryRepository {
  final _apiServices = NetworkApiServices();

  Future<List<Data>> historyListApi(String eid) async {
    try {
      dynamic response =
          await _apiServices.getApi(AppUrl.scanHistoryUrl, eid: eid);
      final scanHistoryResponse = ScanHistoryModel.fromJson(response.data);
      return scanHistoryResponse.data;
      // print(scanHistoryResponse.data);
      // return scanHistoryResponse.data;
      // return ScanHistoryModel.fromJson(response);
      // final parsedResponse = ScanHistoryModel.fromJson(response);
      // bool? isSuccessfull = parsedResponse.isSuccessfull!;
      // if (!isSuccessfull || parsedResponse.data!.isEmpty) {
      //   return [];
      // }
      //
      // return parsedResponse.data ?? [];
      // return response;
      // if (response == null || response['data'] == null) {
      //   return []; // Return an empty list to avoid errors
      // }
      // List<dynamic> dataList = response['data'];
      // return dataList.map((e) => ScanHistoryModel.fromJson(e).da.toList();
      // // if (response is List) {
      // // } else {
      // //   throw Exception('failed_to_load_history'.tr);
      // // }
    } catch (e) {
      print("Error fetching scan history: $e");
      // return []; // Return empty list in case of an exception
    }
    return [];
  }
}
