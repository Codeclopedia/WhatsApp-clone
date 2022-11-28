import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/Pages/chats/receivedmessage.dart';
import 'package:whatsapp_clone/Pages/chats/sendmessage.dart';
import 'package:whatsapp_clone/service/backend.dart';

class TextMessagesPage extends StatelessWidget {
  ScrollController scrollcontrollers;
  backendController backend = Get.find();
  TextMessagesPage({super.key, required this.scrollcontrollers});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
          ),
          child: Obx(() => ListView.builder(
                scrollDirection: Axis.vertical,
                controller: scrollcontrollers,
                shrinkWrap: true,
                itemCount: backend.listofmessages.length,
                itemBuilder: (context, index) {
                  Widget widget = backend.listofmessages[index].sendmessage
                      ? SendMessage(
                          message: backend.listofmessages[index].message)
                      : ReceivedMessage(
                          message: backend.listofmessages[index].message);
                  return widget;
                },
              )),
        ));
  }
}
