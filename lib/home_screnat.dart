import 'package:flutter/material.dart';
import 'facebook_app/home_facebook.dart';
import 'wallet_app/wallet_app_view.dart';

class HomeScrenat extends StatefulWidget {
  const HomeScrenat({Key? key}) : super(key: key);

  @override
  State<HomeScrenat> createState() => _HomeScrenatState();
}

class _HomeScrenatState extends State<HomeScrenat> {
  List<Widget> pages() => [
        HomeFaceBook(),
        WalletAppView(),
      ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: pages(),
    );
  }
}
