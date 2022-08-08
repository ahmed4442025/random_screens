import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/card_button.dart';
import 'widgets/card_trans.dart';
import 'widgets/card_visa.dart';

class WalletAppView extends StatefulWidget {
  WalletAppView({Key? key}) : super(key: key);

  @override
  State<WalletAppView> createState() => _WalletAppViewState();
}

class _WalletAppViewState extends State<WalletAppView> {
  // controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.red.shade400,
          child: const Icon(
            Icons.monetization_on,
            color: Colors.white,
            size: 40,
          )),
      backgroundColor: Colors.grey[100],

      // buttom bar
      bottomNavigationBar: myBottomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // app bar
            box20(),
            myAppBar(),
            box30(),
            // visa cards
            viasaCards(),
            box30(),
            // send pay   bills
            bottonsSend(),
            box30(),

            //transactions
            transactions()

          ],
        ),
      ),
    );
  }

  // boxes
  Widget box20() => const SizedBox(height: 20, width: 20);

  Widget box30() => const SizedBox(height: 30, width: 30);

  // custom appBar
  Widget myAppBar() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Text(
                'My ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Text(
                'Cards',
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration:
                BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle),
            child: const Icon(Icons.add),
          )
        ],
      );

// visaCards Pages
  Widget viasaCards() => Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView(
              controller: _pageController,
              children: [
                CardVisa('1234', '9/24', 5250.20, Colors.purpleAccent),
                CardVisa('3254', '12/22', 4262, Colors.deepPurple),
                CardVisa('9952', '2/23', 10250.50, Colors.purple),
              ],
            ),
          ),
          box20(),
          SmoothPageIndicator(
            controller: _pageController, // PageController
            count: 3,
            effect: const WormEffect(), // your preferred effect
          )
        ],
      );

  // send pay bills
  Widget bottonsSend() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardButton(
              label: "Send", imgPath: "assets/wallet_app/send-money.png"),
          CardButton(
              label: "Pay", imgPath: "assets/wallet_app/credit-card.png"),
          CardButton(label: "Bills", imgPath: "assets/wallet_app/bill.png"),
        ],
      );

//transactions
  Widget transactions() => Column(
        children: [
          CardTrans(
            label: "Statistics",
            description: "Payment and income",
            imgPath: "assets/wallet_app/analysis.png",
          ),
          box20(),
          CardTrans(
            label: "Transactions",
            description: "Transactions History",
            imgPath: "assets/wallet_app/money-transfer.png",
          ),
        ],
      );

// bottom bar
  BottomAppBar myBottomAppBar()=>BottomAppBar(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.grey,),
          Icon(Icons.settings, color: Colors.pinkAccent.shade200,),
        ],
      ),
    ),
  );

}
