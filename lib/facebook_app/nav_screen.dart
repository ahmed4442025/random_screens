import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:screens_ui/facebook_app/home_facebook.dart';

import 'config/palette.dart';

class NavScreenFaceBook extends StatefulWidget {
  const NavScreenFaceBook({Key? key}) : super(key: key);

  @override
  State<NavScreenFaceBook> createState() => _NavScreenFaceBookState();
}

class _NavScreenFaceBookState extends State<NavScreenFaceBook> {
  int currentIndex = 0;
  List<ScreenObj> screens = [
    ScreenObj(const HomeFaceBook(), Icons.home),
    ScreenObj(const _TempScaffold(name: 'Live',), Icons.ondemand_video),
    ScreenObj(const _TempScaffold(name: 'Account',), MdiIcons.accountCircleOutline),
    ScreenObj(const _TempScaffold(name: 'Group',), MdiIcons.accountGroupOutline),
    ScreenObj(const _TempScaffold(name: 'Notification',), MdiIcons.bellOutline),
    ScreenObj(const _TempScaffold(name: 'Menu',), Icons.menu),
  ];

  List<Widget> taps() {
    List<Widget> l = [];
    for (ScreenObj s in screens) {
      l.add(Tab(
          icon: Icon(
        s.icon,
        color: Colors.grey.shade700,
        size: 30,
      )));
    }
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: screens.length,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          indicatorPadding: EdgeInsets.zero,
          indicator: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Palette.facebookBlue,
                width: 3.0,
              ),
            ),
          ),
          tabs: taps(),
          onTap: (i) {
            if (currentIndex != i) {
              setState(() {
                currentIndex = i;
              });
            }
          },
        ),
        body: screens[currentIndex].screen,
      ),
    );
  }
}

class ScreenObj {
  final Widget screen;
  final IconData icon;

  ScreenObj(this.screen, this.icon);
}

class _TempScaffold extends StatelessWidget {
  final String name;

  const _TempScaffold({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(name),
      ),
    );
  }
}
