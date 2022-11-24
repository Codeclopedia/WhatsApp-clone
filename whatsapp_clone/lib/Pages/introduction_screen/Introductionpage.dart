import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:whatsapp_clone/Pages/WelcomePage/welcomePage.dart';
import 'package:whatsapp_clone/Pages/introduction_screen/introductionscreens/introduction_page_1.dart';
import 'package:whatsapp_clone/Pages/introduction_screen/introductionscreens/introduction_page_2.dart';
import 'package:whatsapp_clone/Pages/introduction_screen/introductionscreens/introduction_page_3.dart';
import 'package:whatsapp_clone/Pages/user_check/user_check.dart';

class IntroductionPage extends StatefulWidget {
  IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  PageController pageController = PageController();

  int currentPageIndex = 0;

  List<Widget> listofintroductionpages = const [
    IntroductionPage1(),
    IntroductionPage2(),
    IntroductionPage3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        children: listofintroductionpages,
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        color: const Color.fromARGB(255, 177, 155, 238),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  pageController.jumpToPage(listofintroductionpages.length - 1);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: listofintroductionpages.length,
                effect: const WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: Color.fromARGB(255, 247, 92, 65)),
              ),
              GestureDetector(
                onTap: () {
                  print(currentPageIndex);
                  currentPageIndex == (listofintroductionpages.length - 1)
                      ? {
                          print("onusercheckpage"),
                          Get.to(() => const WelcomePage()),
                          print("after onusercheckpage"),
                        }
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                  print(currentPageIndex);
                },
                child: Text(
                  currentPageIndex == (listofintroductionpages.length - 1)
                      ? "Done"
                      : "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
