class VoiceChatGptModel {
  final String message;
  final bool isMe;

  VoiceChatGptModel({required this.message, required this.isMe});

  factory VoiceChatGptModel.fromJson(Map<String, dynamic> json) {
    return VoiceChatGptModel(
      message: json['MessageContent'],
      isMe: json['MessageBy'] == "User",
    );
  }
}
