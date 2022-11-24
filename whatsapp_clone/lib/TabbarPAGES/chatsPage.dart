import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/Constants/usersdata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:whatsapp_clone/Pages/Homepage.dart';
import 'package:whatsapp_clone/Pages/chats/mainChatPage.dart';

class ChatsPage extends StatefulWidget {
  final Function() isSearchTabOpen;
  const ChatsPage({Key? key, required this.isSearchTabOpen}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  UserDataController userDataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              itemCount: userDataController.users.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.isSearchTabOpen();
                        Get.to(() => MainChatPage(
                            users: userDataController.users[index]));
                      },
                      child: ListTile(
                        leading: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: userDataController.users[index].imageurl,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.07,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userDataController.users[index].username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.0225),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text(
                              userDataController.users[index].lastmessage,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.035),
                            )
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(userDataController.users[index].lastseen),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
