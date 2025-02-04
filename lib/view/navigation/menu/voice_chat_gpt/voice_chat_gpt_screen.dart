import 'package:e_validation/models/navigation/menu/voice_chat_gpt/voice_chat_gpt_model.dart';
import 'package:e_validation/res/assets/icon_assets.dart';
import 'package:e_validation/res/componants/MenuIcon.dart';
import 'package:e_validation/view/navigation/menu/voice_chat_gpt/widget/admin_row_view.dart';
import 'package:e_validation/view/navigation/menu/voice_chat_gpt/widget/user_row_view.dart';
import 'package:e_validation/view_models/controller/voice_chat_gpt/voice_chat_gpt_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
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
    // loadChatMessages();
    // chatVM.chatListApi();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
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
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: WillPopScope(
          onWillPop: () async {
            Get.back();
            return false; // Prevents default back button behavior
          },
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    Get.height * Utils.getResponsiveHeight(124)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * Utils.getResponsiveHeight(60)),
                  child: Container(
                    height: Get.height * Utils.getResponsiveHeight(63),
                    color: AppColor.underlineTextColor,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: Get.height * Utils.getResponsiveSize(24),
                              color: AppColor.textWhite,
                            ), // Change the color here
                            onPressed: () => Get.back(),
                          ),
                        ),
                        Positioned(
                          top: Get.height * Utils.getResponsiveHeight(20),
                          left: 0,
                          right: 0,
                          child: Text(
                            'voice_chat_gpt'.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.textWhite,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                        vertical: Get.height * Utils.getResponsiveHeight(16),
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
                    decoration: BoxDecoration(
                      color:
                          Colors.white, // Add a background color for visibility
                      shape: BoxShape.rectangle, // Makes it rounded (optional)
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.3), // Shadow color with opacity
                          blurRadius: 8, // Soften the shadow
                          spreadRadius: 2, // Extend the shadow
                          offset: Offset(2, 4), // Moves shadow to bottom-right
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  Get.width * Utils.getResponsiveWidth(30),
                            ),
                            child: TextField(
                              controller: chatVM.messageController.value,
                              style: TextStyle(
                                color: AppColor.textGreyPrimary,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: "type here",
                                hintStyle: TextStyle(
                                  color: AppColor.textLightGreyPrimary,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(8)),
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
                        // Container(
                        //   height: Get.height * Utils.getResponsiveHeight(50),
                        //   width: Get.width * Utils.getResponsiveWidth(50),
                        //   color: AppColor.underlineTextColor,
                        //   child: InkWell(
                        //       onTap: () {
                        //         String message =
                        //             chatVM.messageController.value.text.trim();
                        //         if (message.isNotEmpty) {
                        //           // send message logic here
                        //           chatVM.messageController.value.clear();
                        //         }
                        //       },
                        //       child: Image.asset(IconAssets.ic_miq)),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
