import 'package:flutter/material.dart';
import 'package:screens_ui/coffe_shop/coffe_home.dart';
import 'package:screens_ui/facebook_app/nav_screen.dart';
import 'wallet_app/wallet_app_view.dart';

class HomeScrenat extends StatefulWidget {
  const HomeScrenat({Key? key}) : super(key: key);

  @override
  State<HomeScrenat> createState() => _HomeScrenatState();
}

class _HomeScrenatState extends State<HomeScrenat> {
  List<Widget> pages() => [
        CoffeHome(),
        NavScreenFaceBook(),
        WalletAppView(),
      ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages(),
    );
  }
}
