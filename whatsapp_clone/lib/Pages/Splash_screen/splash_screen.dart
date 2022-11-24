import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Constants/appnaming.dart';
import 'package:whatsapp_clone/Pages/user_check/user_check.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.44,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.15,
            child: Image.asset(
              applogo,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "FROM",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.18,
                child: Image.asset(
                  metalogo,
                ),
              ),
            ],
          )
        ],
      ),
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      nextScreen: const UserCheck(),
    );
  }
}
