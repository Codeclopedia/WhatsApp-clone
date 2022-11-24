import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whatsapp_clone/Constants/appnaming.dart';
import 'package:whatsapp_clone/Constants/usersdata.dart';
import 'package:whatsapp_clone/Pages/user_check/user_check.dart';
import 'package:whatsapp_clone/TabbarPAGES/callspage.dart';
import 'package:whatsapp_clone/TabbarPAGES/camerapage.dart';
import 'package:whatsapp_clone/TabbarPAGES/chatsPage.dart';
import 'package:whatsapp_clone/TabbarPAGES/statuspage.dart';
import 'package:whatsapp_clone/home_page_getx_controller.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:whatsapp_clone/service/backend.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  backendController backendcontroller = Get.find();

  bool issearchtabopen = false;
  HomePageGetxController homePageGetxController =
      Get.put(HomePageGetxController());

  UserDataController userDataController = Get.put(UserDataController());

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
    _controller.addListener(_handleTabChange);
    backendcontroller.currentUserdata();
    backendcontroller.createUser();
  }

  _handleTabChange() {
    setState(() {});
  }

  List<Icon> listoficons = const [
    Icon(Icons.message),
    Icon(Icons.message),
    Icon(Icons.camera),
    Icon(Icons.phone),
  ];

  Icon currenticon() {
    if (_controller.animation!.value >
        homePageGetxController.currentIndex.value + 0.5) {
      homePageGetxController.currentIndex.value++;
    } else if (_controller.animation!.value <
        homePageGetxController.currentIndex.value - 0.5) {
      homePageGetxController.currentIndex.value--;
    }

    return listoficons[homePageGetxController.currentIndex.value];
  }

  List<Map> selectedSearch = [
    {"Icon": Icons.message, "title": "Unread"},
    {"Icon": Icons.photo, "title": "Photos"},
    {"Icon": Icons.video_camera_back, "title": "Videos"},
    {"Icon": Icons.link, "title": "Links"},
    {"Icon": Icons.gif, "title": "GIFs"},
    {"Icon": Icons.headphones, "title": "Audio"},
    {"Icon": Icons.contact_page_outlined, "title": "Document"},
    {"Icon": Icons.mic, "title": "Voice messages"}
  ];

  SliverAppBar showSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 177, 155, 238),
      floating: true,
      pinned: true,
      snap: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(appname),
          Row(children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    issearchtabopen = !issearchtabopen;
                  });
                },
                child: const Icon(Icons.search)),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                // PopupMenuItem 1
                const PopupMenuItem(
                  value: 1,
                  child: Text("Get The App"),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.to(() => const UserCheck());
                  },
                  child: const Text("Log out"),
                ),
              ],
            )
          ]),
        ],
      ),
      bottom: TabBar(
        controller: _controller,
        labelColor: Colors.white,
        indicatorColor: Colors.white,
        tabs: [
          const Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            child: Text(
              "Chats",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045),
            ),
          ),
          Tab(
            child: Text(
              "Status",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045),
            ),
          ),
          Tab(
            child: Text(
              "Calls",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar showsearchAppBar(BuildContext context) {
    return SliverAppBar(
        backgroundColor: const Color.fromARGB(255, 177, 155, 238),
        toolbarHeight: MediaQuery.of(context).size.width * 0.4,
        title: Container(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: (() {
                        setState(() {
                          issearchtabopen = !issearchtabopen;
                        });
                      }),
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(103, 255, 255, 255),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.03),
                            hintText: "Search",
                            hintStyle: const TextStyle(color: Colors.white)),
                      )),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 177, 155, 238),
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: MasonryGridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 4,
                      itemCount: selectedSearch.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.01,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.005),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  selectedSearch[index]["Icon"],
                                  color:
                                      const Color.fromARGB(255, 177, 155, 238),
                                  size:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Text(
                                  selectedSearch[index]["title"],
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 177, 155, 238),
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.035,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _controller.index < 0.7
            ? null
            : FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color.fromARGB(255, 177, 155, 238),
                child: Obx(() {
                  return currenticon();
                }),
              ),
        body: CustomScrollView(
          slivers: [
            _controller.index == 0
                ? SliverToBoxAdapter()
                : issearchtabopen
                    ? showsearchAppBar(context)
                    : showSliverAppBar(context),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  controller: _controller,
                  children: [
                    CameraPage(
                      isCameraTabOpen: () {
                        setState(() {
                          _controller.index = 1;
                        });
                      },
                    ),
                    ChatsPage(
                      isSearchTabOpen: () {
                        setState(() {
                          issearchtabopen = false;
                        });
                      },
                    ),
                    const StatusPage(),
                    const CallsPage(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
