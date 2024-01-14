import 'package:flutter/material.dart';
import 'package:simple_chat_app/model/user_model.dart';
import 'package:simple_chat_app/pages/chat_user_pages.dart';

import '../global_widget/global_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
static const String route="login";
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GlobalWidget.initDummyUsers();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Lets Chat"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
      TextField(
        controller: _userController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.all(20.0),

        ),
      ),
            SizedBox(height: 20,),
            OutlinedButton(onPressed: (){
              _loginBtnTap();
            },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
  _loginBtnTap(){
    if(_userController.text.isEmpty){
      return ;
    }
    UserModel me=GlobalWidget.dummyUsers![0];
    print("data ${me.name}");
    if(_userController.text !="a"){
      me=GlobalWidget.dummyUsers![1];
    }
    GlobalWidget.loggedInUser=me;
    _openChatUserListScreen(context);
  }
  _openChatUserListScreen(context)async{
    await Navigator.pushReplacementNamed(context,
        ChatUserPage.route);
  }
}
