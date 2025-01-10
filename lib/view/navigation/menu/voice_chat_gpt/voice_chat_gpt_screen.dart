import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/componants/MenuIcon.dart';
import 'package:e_validation/view/navigation/menu/voice_chat_gpt/widget/admin_row_view.dart';
import 'package:e_validation/view/navigation/menu/voice_chat_gpt/widget/user_row_view.dart';
import 'package:e_validation/view_models/controller/voice_chat_gpt/voice_chat_gpt_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../view_models/controller/user_preference/user_preference_view_model.dart';

class VoiceChatGptScreen extends StatefulWidget {
  const VoiceChatGptScreen({super.key});

  @override
  State<VoiceChatGptScreen> createState() => _VoiceChatGptScreenState();
}

class _VoiceChatGptScreenState extends State<VoiceChatGptScreen> {
  final chatVM = Get.put(VoiceChatGptViewModel());

  void loadChatMessages() async {
    try {
      // Future<List<ChatModel>> messages =  chatVM.chatListApi();
      List<VoiceChatGptModel> messages = await chatVM.chatListApi();
      //     await GetExistingChat.fetchChatMessages(context);

      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
      setState(() {
        chatModelList = messages;
        chatVM.loading.value = false;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  List<VoiceChatGptModel> chatModelList = [];

  @override
  void initState() {
    super.initState();
    loadChatMessages();
    chatVM.chatListApi();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            Colors.white, // Set the status bar background color to white
        statusBarIconBrightness:
            Brightness.dark, // Set the icons to dark for contrast
        statusBarBrightness: Brightness.light, // Adjust brightness for iOS
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  void dispose() {
    // Reset to default when leaving the screen
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Reset status bar background color
        statusBarIconBrightness: Brightness.light, // Default icon brightness
        statusBarBrightness: Brightness.dark, // Default for iOS
      ),
    );
    super.dispose();
  }

  void _scrollToBottom() {
    if (chatVM.scrollController.value.hasClients) {
      chatVM.scrollController.value.animateTo(
        chatVM.scrollController.value.position.maxScrollExtent,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
      );
    }
  }

  void animateList() {
    if (chatVM.scrollController.value.hasClients) {
      chatVM.scrollController.value
          .jumpTo(chatVM.scrollController.value.position.maxScrollExtent);
      Future.delayed(const Duration(milliseconds: 120), () {
        if (chatVM.scrollController.value.hasClients &&
            chatVM.scrollController.value.offset !=
                chatVM.scrollController.value.position.maxScrollExtent) {
          animateList();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: AppColor.underlineTextColor,
          leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset(
              IconAssets.ic_menu,
              color: AppColor.whiteColor,
            ),
          ),
          centerTitle: true,
          title: Text(
            'voice_chat_gpt'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
          )),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(ImageAssets.splash_bg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 24),
                  child: Column(
                    children: [
                      // Existing chat messages here

                      // var chat = messages[index];
                      UserRowView(),

                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          // var chat = messages[index];
                          return AdminRowView();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Input field and send button here
            Container(
              color: AppColor.whiteColor,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: TextField(
                        controller: chatVM.messageController.value,
                        decoration: InputDecoration(
                          hintText: "type here",
                          hintStyle: TextStyle(
                            color: AppColor.blackColor.withOpacity(0.6),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      String message =
                          chatVM.messageController.value.text.trim();
                      if (message.isNotEmpty) {
                        // send message logic here
                        chatVM.messageController.value.clear();
                      }
                    },
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: AppColor.underlineTextColor,
                    child: InkWell(
                        onTap: () {
                          String message =
                              chatVM.messageController.value.text.trim();
                          if (message.isNotEmpty) {
                            // send message logic here
                            chatVM.messageController.value.clear();
                          }
                        },
                        child: Image.asset(IconAssets.ic_miq)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
