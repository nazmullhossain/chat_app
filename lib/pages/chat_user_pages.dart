import 'package:flutter/material.dart';
import 'package:simple_chat_app/pages/chat_pages.dart';
import 'package:simple_chat_app/pages/login_pages.dart';

import '../global_widget/global_widget.dart';
import '../model/user_model.dart';

class ChatUserPage extends StatefulWidget {
  const ChatUserPage({super.key});

  static const String route="chat_user";

  @override
  State<ChatUserPage> createState() => _ChatUserPageState();
}

class _ChatUserPageState extends State<ChatUserPage> {
  List<UserModel>?_chatUsers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatUsers=GlobalWidget.getUsersFor(GlobalWidget.loggedInUser!);
  }
  _openChatUserListScreen(context)async{
    await Navigator.pushReplacementNamed(context,
        LoginPage.route);
  }

  _chatScreen(context)async{
    await Navigator.pushNamed(context,
        ChatPage.route);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text("Chat user page"),
        actions: [
          IconButton(onPressed: (){
            _openChatUserListScreen(context);
          },
              icon: Icon(Icons.close))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            SizedBox(height: 400,
            child: ListView.builder(
                itemCount: _chatUsers!.length,
                itemBuilder: (context,index){
              final user=_chatUsers![index];
              return ListTile(
                onTap: (){
            GlobalWidget.toChatUser=user;
            _chatScreen(context);
                },
                title: Text("${user.name}"),
              );
            }),)
          ],
        ),
      ),
    );
  }
}
