import 'package:flutter/material.dart';
import 'package:simple_chat_app/model/user_model.dart';
enum UserOnlineStatus{
 conneting,online,not_online
}
class ChatTitleWidget extends StatelessWidget {
  const ChatTitleWidget({super.key,
  required this.userOnlineStatus,required this.toChatUser});
  final UserModel toChatUser;
  final UserOnlineStatus userOnlineStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("${toChatUser.name}"),
          Text("${_getStatutsText()}",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white
          ),),


        ],
      ),
    );
  }
  _getStatutsText(){
    if(userOnlineStatus==UserOnlineStatus.online){
      return "online";
    }
    if(userOnlineStatus==UserOnlineStatus.not_online){
      return "not online";
    }
    if(userOnlineStatus==UserOnlineStatus.conneting){
      return "connecting";
    }
  }
}
