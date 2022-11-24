import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/model/userdatamodel.dart';

class StatusPreview extends StatefulWidget {
  final Userdata users;
  const StatusPreview({Key? key, required this.users}) : super(key: key);

  @override
  State<StatusPreview> createState() => _StatusPreviewState();
}

class _StatusPreviewState extends State<StatusPreview>
    with TickerProviderStateMixin {
  //statustimer
  Timer? statustimer;
  double statustime = 0.0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          animation.value >= 0.99 ? {Get.back(), controller.stop()} : {};
        });
      });
    controller.repeat();
    // statustimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //   statustime >= 1.0
    //       ? {
    //           print("1"),
    //           statustimer?.cancel(),
    //           Get.back(),
    //         }
    //       : setState(() {
    //           print("2");
    //           statustime += 0.1;
    //         });
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              LinearProgressIndicator(
                value: animation.value,
                color: Colors.grey,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: widget.users.imageurl,
                            width: MediaQuery.of(context).size.width * 0.105,
                            height: MediaQuery.of(context).size.height * 0.05,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.users.username,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.0225),
                            ),
                            Text(
                              widget.users.lastseen,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: CachedNetworkImage(
                  imageUrl: widget.users.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        statustimer?.cancel();

        return true;
      },
    );
  }
}
