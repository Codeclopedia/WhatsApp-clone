import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Constants/appnaming.dart';

class SendMessage extends StatelessWidget {
  final String message;
  const SendMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width -
                  MediaQuery.of(context).size.width * 0.15),
          child: Container(
              decoration: BoxDecoration(
                  color: primarycolors,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        bottom: MediaQuery.of(context).size.height * 0.03,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      message.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.04),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        Text(
                          "1:00 am",
                          style: TextStyle(
                              color: Color.fromARGB(255, 209, 209, 209),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                        Icon(Icons.done_all,
                            size: MediaQuery.of(context).size.width * 0.04,
                            color: Color.fromARGB(255, 209, 209, 209))
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
