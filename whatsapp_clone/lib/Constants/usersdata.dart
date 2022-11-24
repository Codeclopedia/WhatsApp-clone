import 'package:get/get.dart';
import 'package:whatsapp_clone/model/userdatamodel.dart';

List<Userdata> userdata = [
  Userdata(
      username: "Chetan Boss",
      lastseen: "7:36 pm",
      lastmessage: "Hey you there?",
      imageurl:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Bhupi Frnd",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Ganesh jijagi",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Mom",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/532220/pexels-photo-532220.jpeg?auto=compress&cs=tinysrgb&w=1600",
      isgroup: false),
  Userdata(
      username: "Dad",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&w=1600",
      isgroup: false),
  Userdata(
      username: "Brother",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/775358/pexels-photo-775358.jpeg?auto=compress&cs=tinysrgb&w=1600",
      isgroup: false),
  Userdata(
      username: "Bhupi Frnd",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Bhupi Frnd",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Bhupi Frnd",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Bhupi Frnd",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      isgroup: false),
  Userdata(
      username: "Sister",
      lastseen: "6:06 pm",
      lastmessage: "Hey you there? Broooo",
      imageurl:
          "https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&w=1600",
      isgroup: false),
];

class UserDataController extends GetxController {
  RxList<Userdata> users = <Userdata>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    addinitialdata();
  }

  addinitialdata() {
    users.addAll(userdata);
  }
}
