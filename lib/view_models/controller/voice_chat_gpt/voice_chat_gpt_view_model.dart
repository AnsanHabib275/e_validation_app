import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:e_validation/repository/voice_chat_gpt_repository/voice_chat_gpt_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../data/response/status.dart';
import '../../../utils/utils.dart';
import '../user_preference/user_preference_view_model.dart';

class VoiceChatGptViewModel extends GetxController {
  final _api = VoiceChatGptRepository();
  final rxRequestStatus = Status.LOADING.obs;
  List<VoiceChatGptModel> _chatList = [];

  List<VoiceChatGptModel> get chatList => _chatList;

  RxString error = ''.obs;
  RxBool loading = false.obs;
  final messageController = TextEditingController().obs;
  final scrollController = ScrollController().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setChatList(List<VoiceChatGptModel> chat) => _chatList = chat;

  void setError(String value) => error.value = value;

  Future<List<VoiceChatGptModel>> chatListApi() {
    UserPreference userPreference = UserPreference();
    return userPreference.getUser().then((user) {
      return _api.chatListApi(user.user!.eID!).then((chatList) {
        setRxRequestStatus(Status.COMPLETED);
        setChatList(chatList);
        return chatList;
      }).onError((error, stackTrace) {
        setError(error.toString());
        setRxRequestStatus(Status.ERROR);
        throw Exception('failed_to_fetch_chat_list'.tr);
      });
    });
  }

  void sendMessageApi(String uid, String apiKey) async {
    loading.value = true;
    Map data = {
      'message_content': messageController.value.text,
      'uid': uid,
    };
    try {
      final value = await _api.sendMessageApi(data, apiKey);
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        error.value = value['message'];
      } else {
        Utils.toastMessage(value['Response']);
      }
    } catch (e) {
      loading.value = false;
      error.value = e.toString();
    }
  }
}
