import 'package:flutter/material.dart';

class IntroductionPage1 extends StatelessWidget {
  const IntroductionPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/lotties/116791-chat.gif"),
        Text(
          "Enjoy the new texting experience",
          style: TextStyle(
              color: const Color.fromARGB(255, 177, 155, 238),
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Odio ut sem nulla pharetra diam sit amet nisl suscipit. Diam volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Amet est placerat in egestas erat imperdiet sed. In est ante in nibh mauris cursus mattis. Felis bibendum ut tristique et egestas quis ipsum.",
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.03),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
      ],
    );
  }
}
