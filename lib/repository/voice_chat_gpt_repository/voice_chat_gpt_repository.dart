import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/network/network_api_services.dart';
import '../../../../../res/urls/app_url.dart';

class VoiceChatGptRepository {
  final _apiServices = NetworkApiServices();

  Future<List<VoiceChatGptModel>> chatListApi(String eid) async {
    dynamic response = await _apiServices.getApi(AppUrl.signupUrl, eid: eid);
    // return response;
    if (kDebugMode) {
      print(response);
    }
    if (response is List) {
      return response.map((e) => VoiceChatGptModel.fromJson(e)).toList();
    } else {
      throw Exception('failed_to_load_chats'.tr);
    }
  }

  Future<dynamic> sendMessageApi(var data, String eid) async {
    dynamic response =
        await _apiServices.postApi(data, AppUrl.signupUrl, eid: eid);
    return response;
  }
}
