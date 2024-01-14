

import 'package:simple_chat_app/pages/chat_pages.dart';
import 'package:simple_chat_app/pages/chat_user_pages.dart';
import 'package:simple_chat_app/pages/login_pages.dart';

class Routes{
  static routes(){
    return {
      LoginPage.route:(context)=>LoginPage(),
      ChatUserPage.route:(context)=>ChatUserPage(),
      ChatUserPage.route:(context)=>ChatUserPage(),
      ChatPage.route:(context)=>ChatPage(),
    };
  }
  static initScreen(){
    return LoginPage.route;
  }
}