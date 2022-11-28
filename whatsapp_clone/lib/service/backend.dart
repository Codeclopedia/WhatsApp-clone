import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone/model/messagemodel.dart';

class backendController extends GetxController {
  late IO.Socket socket;
  var user;
  RxList<messagemodel> listofmessages = <messagemodel>[].obs;

  void currentUserdata() {
    user = FirebaseAuth.instance.currentUser;
  }

  void connect() {
    socket = IO.io("http://192.168.1.39:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((data) {
      print("connected");
      socket.on(
          "/messageReceived",
          (messagedata) => {
                listofmessages
                    .add(messagemodel(sendmessage: false, message: messagedata))
              });
    });
    socket.emit("/test", "hello world");
  }

  void createUser() {
    socket.emit("/CreateUser", user!.phoneNumber.toString());
  }

  void sendmessage(String message, String sourceId, String destinationId) {
    socket.emit("/messageSent", {
      "message": message,
      "sourceId": sourceId,
      "destinationId": "+919910363084",
    });
    listofmessages.add(messagemodel(
      sendmessage: true,
      message: message,
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connect();
  }
}
