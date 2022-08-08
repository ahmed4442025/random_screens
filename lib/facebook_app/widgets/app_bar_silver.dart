import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import 'widget_manager.dart';


class AppBarSilver extends StatelessWidget {
  const AppBarSilver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: const Text(
        'facebook',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: -1.2,
            color: Palette.facebookBlue),
      ),
      actions: [
        ManagerWidget.iconButton(icon: Icons.search),
        const SizedBox(width: 20,),
        ManagerWidget.iconButton(icon: MdiIcons.facebookMessenger),
      ],
    );
  }
}
