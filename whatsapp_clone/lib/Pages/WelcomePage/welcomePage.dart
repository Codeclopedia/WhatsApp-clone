import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_clone/Constants/appnaming.dart';
import 'package:whatsapp_clone/Pages/Authentication/phone.dart';
import 'package:whatsapp_clone/Pages/user_check/user_check.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
          ),
          Text(
            "Welcome to ChatApp",
            style: TextStyle(
                color: const Color.fromARGB(255, 177, 155, 238),
                fontWeight: FontWeight.w900,
                fontSize: MediaQuery.of(context).size.width * 0.07),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
                "assets/lotties/74908-girl-chatting-with-online-friends.gif"),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.045),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.037),
                        text: "Read our "),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                'https://www.whatsapp.com/legal/privacy-policy/?lang=en';

                            await launchUrlString(url);
                          },
                        style: TextStyle(
                            color: const Color.fromARGB(255, 54, 124, 255),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.037),
                        text: "Privacy Policy."),
                    TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.width * 0.037),
                        text: " Tap \"Agree and Continue\" to accept the"),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            var url =
                                'https://www.whatsapp.com/legal/terms-of-service/?lang=en';

                            await launchUrlString(url);
                          },
                        style: TextStyle(
                            color: const Color.fromARGB(255, 54, 124, 255),
                            fontSize:
                                MediaQuery.of(context).size.width * 0.037),
                        text: " Terms of service."),
                  ]))),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const UserCheck());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 177, 155, 238),
              fixedSize: Size(MediaQuery.of(context).size.width * 0.7,
                  MediaQuery.of(context).size.height * 0.06),
            ),
            child: const Text("Accept & Continue"),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "FROM",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.18,
                child: Image.asset(
                  metalogo,
                  color: const Color.fromARGB(255, 177, 155, 238),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
