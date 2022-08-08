import 'package:flutter/material.dart';
import 'data/data.dart';
import 'widgets/widget_manager.dart';

class HomeFaceBook extends StatefulWidget {
  const HomeFaceBook({Key? key}) : super(key: key);

  @override
  State<HomeFaceBook> createState() => _HomeFaceBookState();
}

class _HomeFaceBookState extends State<HomeFaceBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: myBody(),
    );
  }

  Widget myBody() => CustomScrollView(
        slivers: [
          // app bar
          ManagerWidget.appBarSilver(),

          // post create
          SliverToBoxAdapter(
            child: ManagerWidget.CreatePost(imgUrl: currentUser.imageUrl),
          ),
          box10(),
          // rooms
          SliverToBoxAdapter(
            child: ManagerWidget.listUsersRooms(onlineUsers),
          ),
          box10(),
          // storiesList
          SliverToBoxAdapter(
            child: ManagerWidget.stories(stories),
          ),
          // ------------- posts
          SliverList(
            delegate: SliverChildBuilderDelegate((c, i) {
              return ManagerWidget.onePost(posts[i]);
            }, childCount: posts.length),
          ),
          // -------------
          SliverToBoxAdapter(
            child: boxColor(Colors.green),
          ),
          SliverToBoxAdapter(
            child: boxColor(Colors.red),
          ),
          SliverToBoxAdapter(
            child: boxColor(Colors.blue),
          ),
          SliverToBoxAdapter(
            child: boxColor(Colors.pinkAccent),
          ),
        ],
      );

  Widget boxColor(Color clr) => Container(
        height: 700,
        color: clr,
      );

  Widget box10() => const SliverToBoxAdapter(
        child: SizedBox(
          height: 10,
        ),
      );
}
