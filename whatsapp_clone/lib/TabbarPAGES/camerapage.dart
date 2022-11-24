import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/Pages/Homepage.dart';
import 'package:whatsapp_clone/main.dart';

class CameraPage extends StatefulWidget {
  final Function() isCameraTabOpen;
  const CameraPage({super.key, required this.isCameraTabOpen});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController cameraController;
  bool isbackcamera = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startcamera();
  }

  Future<void> startcamera() async {
    cameraController =
        CameraController(cameras[isbackcamera ? 0 : 1], ResolutionPreset.high);
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
    }).catchError((e) {
      print("The error in camera wif=dget is: $e");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(cameraController)),
              Positioned(
                top: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.01,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            widget.isCameraTabOpen();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: MediaQuery.of(context).size.width * 0.08,
                          ),
                        ),
                        Icon(
                          Icons.flash_on,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.image,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.circle_outlined,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.width * 0.2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isbackcamera = !isbackcamera;
                                    startcamera();
                                  });
                                },
                                child: Icon(
                                  Icons.flip_camera_android,
                                  color: Colors.white,
                                  size:
                                      MediaQuery.of(context).size.width * 0.08,
                                ),
                              )
                            ],
                          ),
                          const Text(
                            "Tap for photo , Hold for videos",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
