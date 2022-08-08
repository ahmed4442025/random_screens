import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screens_ui/facebook_app/config/palette.dart';
import 'package:screens_ui/facebook_app/widgets/widget_manager.dart';
import '../models/models.dart';

class CardOnlineRooms extends StatelessWidget {
  List<User> users;

  CardOnlineRooms({Key? key, required this.users}) : super(key: key);

  List<Widget> widgets() {
    List<Widget> l = [box15(), live(), box15()];

    for (var element in users) {
      l.add(ManagerWidget.userAvatar(element.imageUrl, true));
      l.add(box15());
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widgets(),
          ),
        ),
      ),
    );
  }

  Widget live() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent.shade100, width: 3),
            borderRadius: BorderRadius.circular(50)),
        child: TextButton.icon(
            onPressed: () {},
            icon: ShaderMask(
              shaderCallback: (rect) =>
                  Palette.createRoomGradient.createShader(rect),
              child: const Icon(
                Icons.video_call,
                size: 35,
                color: Colors.white,
              ),
            ),
            label: const SizedBox(
                width: 50,
                child: Text(
                  "Create Room",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ))),
      );

  SizedBox box15() => const SizedBox(
        width: 15,
      );
}
