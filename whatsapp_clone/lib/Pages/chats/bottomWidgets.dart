import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/Constants/appnaming.dart';
import 'package:whatsapp_clone/Constants/usersdata.dart';

import '../../service/backend.dart';

class BottomWidgets extends StatefulWidget {
  final String username;
  const BottomWidgets({Key? key, required this.username}) : super(key: key);

  @override
  State<BottomWidgets> createState() => _BottomWidgetsState();
}

class _BottomWidgetsState extends State<BottomWidgets> {
  bool istyping = false;
  TextEditingController emojipicker = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  FocusNode keyboardFocusNode = FocusNode();
  bool isemojiopen = false;
  backendController backendcontroller = Get.find();

  @override
  void dispose() {
    // TODO: implement dispose
    emojipicker.dispose();
    textEditingController.dispose();
    keyboardFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.015,
                    vertical: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() {
                          keyboardFocusNode.unfocus();
                          keyboardFocusNode.canRequestFocus = false;
                          isemojiopen = !isemojiopen;
                        }),
                        child: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          focusNode: keyboardFocusNode,
                          controller: textEditingController,
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.02),
                              hintText: 'Type your message',
                              border: InputBorder.none),
                          onTap: () {
                            setState(() {
                              isemojiopen = false;
                            });
                          },
                          onChanged: (value) {
                            value.isNotEmpty
                                ? {
                                    setState(() {
                                      istyping = true;
                                    })
                                  }
                                : {
                                    setState(() {
                                      istyping = false;
                                    })
                                  };
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: const Icon(
                          Icons.link,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01,
                            vertical:
                                MediaQuery.of(context).size.height * 0.005),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.currency_rupee,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (textEditingController.text.length > 0) {
                    backendcontroller.sendmessage(
                        textEditingController.text.toString(),
                        backendcontroller.user.phoneNumber,
                        widget.username);
                    textEditingController.clear();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03,
                      vertical: MediaQuery.of(context).size.height * 0.015),
                  decoration: BoxDecoration(
                      color: primarycolors,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    istyping ? Icons.send : Icons.mic,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width * 0.07,
                  ),
                ),
              ),
            ],
          ),
          isemojiopen
              ? SizedBox(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: emojiPicker())
              : Container()
        ],
      ),
    );
  }

  Widget emojiPicker() {
    return EmojiPicker(
      onEmojiSelected: (Category? category, Emoji emoji) {
        setState(() {
          textEditingController.text = textEditingController.text + emoji.emoji;
        });
      },
      onBackspacePressed: () {
        isemojiopen
            ? {
                setState(() {
                  isemojiopen = false;
                })
              }
            : {};
      },
      textEditingController:
          emojipicker, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
      config: const Config(
        columns: 7,
        emojiSizeMax: 32,
        verticalSpacing: 0,
        horizontalSpacing: 0,
        gridPadding: EdgeInsets.zero,
        initCategory: Category.RECENT,
        bgColor: Color(0xFFF2F2F2),
        indicatorColor: Colors.blue,
        iconColor: Colors.grey,
        iconColorSelected: Colors.blue,
        backspaceColor: Colors.blue,
        skinToneDialogBgColor: Colors.white,
        skinToneIndicatorColor: Colors.grey,
        enableSkinTones: true,
        showRecentsTab: true,
        recentsLimit: 28,
        noRecents: const Text(
          'No Recents',
          style: TextStyle(fontSize: 20, color: Colors.black26),
          textAlign: TextAlign.center,
        ),
        tabIndicatorAnimDuration: kTabScrollDuration,
        categoryIcons: const CategoryIcons(),
        buttonMode: ButtonMode.MATERIAL,
      ),
    );
  }
}
