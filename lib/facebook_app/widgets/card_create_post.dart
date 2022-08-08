import 'dart:io';
import 'package:http/io_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screens_ui/facebook_app/widgets/widget_manager.dart';

class CardCreatePost extends StatelessWidget {
  String imgUrl;

  CardCreatePost({Key? key, this.imgUrl = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // image and post
            Row(
              children: [
                ManagerWidget.userAvatar(imgUrl, true),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                    child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind?"),
                ))
              ],
            ),
            // line
            line(),
            // live, photo, room
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  rowIconText(Icons.videocam, 'Live', Colors.red),
                  lineH(),
                  rowIconText(
                      Icons.photo_library_outlined, 'Photo', Colors.green),
                  lineH(),
                  rowIconText(
                      Icons.video_call, 'Room', Colors.purpleAccent),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget line() => const Divider(thickness: .7,);

  Widget lineH() => const VerticalDivider(thickness: .7,);

  Widget rowIconText(IconData icon, String label, Color iconClr) =>
      TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            color: iconClr,
          ),
          label: Text(
            label,
            style: const TextStyle(color: Colors.black),
          ));
}
