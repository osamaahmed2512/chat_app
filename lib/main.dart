import 'package:chat_app_last/pages/chat_page.dart';
import 'package:chat_app_last/pages/login_page.dart';
import 'package:chat_app_last/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat_app());
}

class chat_app extends StatelessWidget {  
  const chat_app({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        'LoginPage':(context)=> loginpage(),
        registerPage.id:(context) => registerPage(),
        ChatPage.id:(context) => ChatPage()
      } ,
      //  home:  loginpage(),
      initialRoute: "LoginPage",
     
    );
  }
}


