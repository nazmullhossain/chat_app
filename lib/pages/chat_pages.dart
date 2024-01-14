import 'package:flutter/material.dart';
import 'package:simple_chat_app/global_widget/chat_title_widget.dart';
import 'package:simple_chat_app/global_widget/global_widget.dart';
import 'package:simple_chat_app/model/user_model.dart';

import '../model/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static const String route="chat";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> _chatMessages=[];
  UserModel? _toChatUser;
  UserOnlineStatus? _userOnlineStatus;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _toChatUser=GlobalWidget.toChatUser;
    _userOnlineStatus=UserOnlineStatus.conneting;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: ChatTitleWidget(
          userOnlineStatus: _userOnlineStatus!,
          toChatUser: _toChatUser!,),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(height: 400,
              child: ListView.builder(
                  itemCount: _chatMessages!.length,
                  itemBuilder: (context,index){
                    final ChatModel chatMessage=_chatMessages![index];
                    return Text("${chatMessage.message}");
                  }),),
            _bottomChatArea()
          ],
        ),
      ),
    );

  }

  _bottomChatArea(){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          _chatTextArea(),
          IconButton(onPressed: (){}, icon: Icon(Icons.send))

        ],
      ),
    );
  }

  _chatTextArea(){
    return Expanded(child: TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        filled: true,
        fillColor: Colors.white,
       contentPadding: EdgeInsets.all(10),
        hintText: "type message"

      ),
    ));
  }
}
