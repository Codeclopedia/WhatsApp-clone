import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whatsapp_clone/Pages/Authentication/phone.dart';
import 'package:whatsapp_clone/Pages/Homepage.dart';
import 'package:whatsapp_clone/Pages/Splash_screen/splash_screen.dart';
import 'package:whatsapp_clone/Pages/WelcomePage/welcomePage.dart';
import 'package:whatsapp_clone/Pages/errorPage/error_page.dart';
import 'package:whatsapp_clone/Pages/introduction_screen/Introductionpage.dart';
import 'package:whatsapp_clone/main.dart';

class UserCheck extends StatefulWidget {
  const UserCheck({super.key});

  @override
  State<UserCheck> createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  @override
  void initState() {
    super.initState();
    prefrence();
  }

  Future<void> prefrence() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    initscreen = (preferences.getInt("initscreen"));
    await preferences.setInt("initscreen", 1);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("oneindicatorpage");
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          print("onerrorpage");
          return const ErrorPage();
        }
        if (snapshot.hasData) {
          print("onhomepage");
          return const Homepage();
        }
        print("i'mhere");
        print("current value of initscreen is: $initscreen");

        Widget widget = initscreen == 0 || initscreen == null
            ? IntroductionPage()
            : const MyPhone();

        return widget;
      },
    );
  }
}
