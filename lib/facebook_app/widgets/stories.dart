import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screens_ui/facebook_app/config/palette.dart';
import 'package:screens_ui/facebook_app/data/data.dart';
import 'package:screens_ui/facebook_app/widgets/widget_manager.dart';

import '../models/models.dart';

class StoriesView extends StatelessWidget {
  final List<Story> storiesList;

  const StoriesView({Key? key, required this.storiesList}) : super(key: key);

  List<Widget> widgets() {
    final Story myStory =
        Story(user: currentUser, imageUrl: currentUser.imageUrl);
    List<Widget> l = [
      const SizedBox(width: 10,),
      _oneStory(
        story: myStory,
        isMe: true,
      )
    ];

    for (var element in storiesList) {
      l.add(_oneStory(story: element));
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: widgets(),
        ),
      ),
    );
  }
}

class _oneStory extends StatelessWidget {
  final bool isMe;
  final Story story;

  const _oneStory({Key? key, this.isMe = false, required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
      child: Stack(
        children: [
          // story image
          Stack(
            children: [
              SizedBox(
                width: 120,
                height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(

                        imageUrl: story.imageUrl, fit: BoxFit.cover)),
              ),

              // shadow
              Container(
                  width: 120,
                  height: 180,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: Palette.shadowList,
                      )
                  )
              )
            ],
          ),
          // avatar
          Positioned(
              top: 10,
              left: 10,
              child: isMe
                  // yes current user
                  ? const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ))
                  // other users
                  : ManagerWidget.userAvatar(story.user.imageUrl, false,
                      frame: !story.isViewed)),
          // name
          Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                width: 100,
                child: Text(
                  story.user.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16),
                ),
              )),
        ],
      ),
    );
  }
}
