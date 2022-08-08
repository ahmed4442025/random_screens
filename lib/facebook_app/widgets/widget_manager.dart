import 'package:flutter/material.dart';
import 'package:screens_ui/facebook_app/widgets/card_create_post.dart';
import 'package:screens_ui/facebook_app/widgets/online_users_room.dart';
import 'package:screens_ui/facebook_app/widgets/post_container.dart';
import 'package:screens_ui/facebook_app/widgets/stories.dart';
import 'package:screens_ui/facebook_app/widgets/user_avatar.dart';
import '../widgets/icon_button.dart';
import 'app_bar_silver.dart';
import '../models/models.dart';

class ManagerWidget {
  static Widget appBarSilver() => const AppBarSilver();

  static Widget iconButton({IconData? icon, VoidCallback? onPressed}) =>
      IconButtonCustom(onPressed: onPressed, icon: icon);

  static Widget CreatePost({String imgUrl = ""}) => CardCreatePost(
        imgUrl: imgUrl,
      );

  static Widget listUsersRooms(List<User> users) =>
      CardOnlineRooms(users: users);

  static Widget userAvatar(String img, isActive, {bool frame = false}) =>
      UserAvatar(
        imgUser: img,
        isActive: isActive,
        frame: frame,
      );

  static Widget stories(List<Story> storiesList) => StoriesView(
        storiesList: storiesList,
      );

  static Widget onePost(Post post) => PostContainer(post: post,);
}
