import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:screens_ui/facebook_app/config/palette.dart';
import 'package:screens_ui/facebook_app/models/models.dart';
import 'package:screens_ui/facebook_app/widgets/widget_manager.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // post header
          _PostHeader(post: post),
          // post content text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.caption),
          ),
          // post content image
          _PostImage(
            post: post,
          ),
          // post title
          PostTitle(post: post)
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          // avatar
          ManagerWidget.userAvatar(post.user.imageUrl, false),
          const SizedBox(
            width: 20,
          ),
          // name + post date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} . ",
                    style: const TextStyle(color: Palette.grey600),
                  ),
                  const Icon(
                    Icons.public,
                    size: 15,
                    color: Palette.grey600,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          // options
          const Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}

class PostTitle extends StatelessWidget {
  final Post post;

  const PostTitle({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          // info
          Row(
            children: [
              // likes
              Row(
                children: [
                  const CircleAvatar(
                      radius: 11,
                      child: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 15,
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    post.likes.toString(),
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                ],
              ),
              const Spacer(),
              // comments
              Text(
                "${post.comments}  Comments   ${post.shares}  Shares",
                style: TextStyle(color: Colors.grey.shade700),
              )
            ],
          ),
          const Divider(),
          // like, comment, share
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // like
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up_off_alt_outlined, color: Colors.grey.shade700,),
                  label: Text('Like', style: TextStyle(color: Colors.grey.shade700, fontSize: 16))),
              // comment
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(MdiIcons.commentOutline, color: Colors.grey.shade700,),
                  label: Text('Comment', style: TextStyle(color: Colors.grey.shade700, fontSize: 16))),
              // share
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(MdiIcons.shareOutline, color: Colors.grey.shade700,size: 27,),
                  label: Text('Share', style: TextStyle(color: Colors.grey.shade700, fontSize: 16))),
            ],
          )
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  final Post post;

  const _PostImage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((post.imageUrl.isEmpty || post.imageUrl == "")) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CachedNetworkImage(imageUrl: post.imageUrl),
      );
    }
  }
}
