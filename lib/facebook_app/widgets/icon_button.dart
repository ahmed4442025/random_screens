import 'package:flutter/material.dart';

class IconButtonCustom extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;

  const IconButtonCustom({Key? key, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration:  BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.black, size: 30,),
      ),
    );
  }
}
