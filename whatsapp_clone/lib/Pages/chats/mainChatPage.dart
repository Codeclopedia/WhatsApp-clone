import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Constants/appnaming.dart';

import 'package:whatsapp_clone/Pages/chats/bottomWidgets.dart';
import 'package:whatsapp_clone/Pages/chats/textmessagepage.dart';
import 'package:whatsapp_clone/model/userdatamodel.dart';

class MainChatPage extends StatelessWidget {
  final Userdata users;
  MainChatPage({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolors,
        leadingWidth: MediaQuery.of(context).size.width * 0.06,
        title: Row(
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: users.imageurl,
                width: MediaQuery.of(context).size.width * 0.105,
                height: MediaQuery.of(context).size.height * 0.05,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  users.username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.0225),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text(
                  users.lastmessage,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035),
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: const Icon(Icons.phone),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.03),
            child: const Icon(Icons.videocam),
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.03),
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/chatBackground.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            TextMessagesPage(),
            BottomWidgets(username: users.username),
          ],
        ),
      ),
    );
  }
}
