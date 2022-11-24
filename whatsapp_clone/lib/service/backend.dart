import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone/model/messagemodel.dart';

class backendController extends GetxController {
  late IO.Socket socket;
  var user;

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
          (messagedata) => messagemodel(
              sendmessage: false, message: messagedata["message"]));
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
      "destinationId": destinationId
    });
  }

  void receivemessage(String message, String sourceId, String destinationId) {
    socket.on("/messageReceived", (data) => print("messageReceived"));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    connect();
  }
}
