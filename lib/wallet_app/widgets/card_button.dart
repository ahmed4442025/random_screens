import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  String label = "send";
  String imgPath = "assets/wallet_app/send-money.png";

  CardButton({Key? key, required this.label, required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 30,
                    spreadRadius: 10)
              ]),
          child: Image(
            image: AssetImage(imgPath),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: const TextStyle(
              fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
