class ChatModel {
  int? chatId;
  int? to;
  int? from;
  String? message;
  String? chatType;
  bool? toUserOnlineStaus;

  ChatModel(
      {this.chatId,
        this.to,
        this.from,
        this.message,
        this.chatType,
        this.toUserOnlineStaus});

  ChatModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    to = json['to'];
    from = json['from'];
    message = json['message'];
    chatType = json['chat_type'];
    toUserOnlineStaus = json['to_user_online_staus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chat_id'] = this.chatId;
    data['to'] = this.to;
    data['from'] = this.from;
    data['message'] = this.message;
    data['chat_type'] = this.chatType;
    data['to_user_online_staus'] = this.toUserOnlineStaus;
    return data;
  }
}
