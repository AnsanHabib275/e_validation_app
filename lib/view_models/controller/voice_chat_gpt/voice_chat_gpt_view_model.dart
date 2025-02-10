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

  Future<bool> sendMessageApi(String uid, String apiKey) async {
    loading.value = true;
    Map data = {
      'message_content': messageController.value.text,
      'uid': uid,
    };
    try {
      final value = await _api.sendMessageApi(data, apiKey);
      loading.value = false;
      if (value['error_code'] == 3087) {
        //"PLEASE_ADD_QUANTITY_TO_CONTINUE" // when quantity not enter
        Utils.toastMessage(value['error_message']);
        return false;
      } else if (value['error_code'] == 3028) {
        //"INVALID_API_KEYS" when wrong api key enter
        Utils.toastMessage(value['error_message']);
        return false;
      } else if (value['error_code'] == 3057) {
        //"ACCOUNT_NOT_FOUND"  //when wrong uid enter
        Utils.toastMessage(value['error_message']);
        return false;
      } else if (value['error_code'] == 3086) {
        //"PLEASE_ADD_PRODUCTS_TO_CONTINUE" when product id not enter
        Utils.toastMessage(value['error_message']);
        return false;
      } else if (value['error_code'] == 4003) {
        //"INVALID_UID" // when uid not enter
        Utils.toastMessage(value['error_message']);
        return false;
      } else {
        Utils.toastMessage(value['Response']);
        return true;
      }
    } catch (e) {
      loading.value = false;
      Utils.toastMessage(e.toString());
      return false;
    }
  }
}
