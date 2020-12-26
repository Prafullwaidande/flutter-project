import 'package:firebase_core/firebase_core.dart';
import 'package:firechat/screen/chatpage.dart';
import 'package:firechat/screen/index.dart';
import 'package:firechat/screen/linux.dart';
import 'package:firechat/screen/login.dart';
import 'package:firechat/screen/pick.dart';
import 'package:firechat/screen/reg.dart';
import 'package:firechat/screen/splash.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: "splash",
         routes: {
           "index": (context) => MyIndex(),
           "linux": (context) => MyLinux(),
           "login": (context) => MyLogin(),
           "reg": (context) => MyReg(),
           "chatpage": (context) => MyChatpage(),
           "splash": (context) => MySplash(),
           "pick": (context) => MyPick(),

         },
      ),
      );
}