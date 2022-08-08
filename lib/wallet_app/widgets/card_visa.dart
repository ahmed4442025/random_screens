import 'package:flutter/material.dart';

class CardVisa extends StatelessWidget {
  String id = "1234";
  String expierDate = "10/24";
  double balance = 5250.2;
  String imgVisa = "assets/wallet_app/visa.png";
  Color clr = Colors.pinkAccent;

  CardVisa(this.id, this.expierDate, this.balance, this.clr, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(20)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _text('Balance', fSize: 18),
              SizedBox(
                height: 50,
                child: Image(
                  image: AssetImage(imgVisa),
                ),
              )
            ],
          ),
          _text('\$$balance', fSize: 34),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _text('**** $id'),
              _text('$expierDate'),
            ],
          )
        ],
      ),
    );
  }

  Widget _text(String data, {double fSize = 12}) => Text(
        data,
        style: TextStyle(fontSize: fSize, color: Colors.white),
      );
}
