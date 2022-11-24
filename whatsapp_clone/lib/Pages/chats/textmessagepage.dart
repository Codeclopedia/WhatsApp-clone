import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/chats/receivedmessage.dart';
import 'package:whatsapp_clone/Pages/chats/sendmessage.dart';

class TextMessagesPage extends StatelessWidget {
  TextMessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SendMessage(),
              ReceivedMessage(),
              SendMessage(),
              ReceivedMessage(),
              SendMessage(),
              ReceivedMessage(),
              SendMessage(),
              ReceivedMessage(),
              SendMessage(),
              ReceivedMessage(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              )
            ],
          ),
        ));
  }
}
