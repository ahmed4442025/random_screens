import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../config/palette.dart';

class UserAvatar extends StatelessWidget {
  final String imgUser;
  final bool isActive;
  final bool frame;

  const UserAvatar(
      {Key? key,
      required this.imgUser,
      required this.isActive,
      required this.frame})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Palette.facebookBlue,
          radius: frame ? 23 : 20,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(imgUser),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Palette.online : null,
            ),
            width: 15,
            height: 15,
          ),
        )
      ],
    );
  }
}
