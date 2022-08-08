import 'package:flutter/material.dart';

class CardTrans extends StatelessWidget {
  String imgPath = "assets/wallet_app/send-money.png";
  String label = "Statistics";
  String description = "Payment and income";

  CardTrans(
      {Key? key,
      required this.label,
      required this.description,
      required this.imgPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: 90,
          height: 90,
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
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            )
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    );
  }
}
