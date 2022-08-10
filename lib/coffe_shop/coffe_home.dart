import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_ui/coffe_shop/data/data.dart';
import 'package:screens_ui/coffe_shop/util/coffee_card.dart';
import 'package:screens_ui/coffe_shop/util/coffee_type_lable.dart';
import 'package:screens_ui/coffe_shop/util/text_search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CoffeHome extends StatefulWidget {
  const CoffeHome({Key? key}) : super(key: key);

  @override
  State<CoffeHome> createState() => _CoffeeHomeState();
}

class _CoffeeHomeState extends State<CoffeHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white.withOpacity(.9)),
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        // app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Icon(
                Icons.menu,
              )),
          actions: const [
            Icon(
              Icons.person,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        // body
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              // welcome
              Text('Find the best coffee for you',
                  style: GoogleFonts.bebasNeue(fontSize: 60)),
              const SizedBox(
                height: 15,
              ),
              // search bar
              const TextSearch(),
              const SizedBox(
                height: 15,
              ),
              // coffee types
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DataCoffee.coffeeTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoffeeTypeLable(
                        coffeeType: DataCoffee.coffeeTypes[index],
                        onTap: () => changeCoffeeLabelIndex(index));
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // coffee offers
              SizedBox(
                height: 380,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: DataCoffee.coffeeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CoffeeCard(coffee: DataCoffee.coffeeList[index]);
                  },
                ),
              ),
            ],
          ),
        ),

        // bottomNavigationBar
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.grey.shade800,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.orange.withOpacity(.9),
          items: [
            Icon(
              Icons.home,
              color: Colors.grey.shade400,
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey.shade400,
            ),
            Icon(
              Icons.notifications,
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }

  // -----------------
  void changeCoffeeLabelIndex(int index) {
    for (var element in DataCoffee.coffeeTypes) {
      element.isSelected = false;
    }
    DataCoffee.coffeeTypes[index].isSelected = true;
    setState(() {});
  }
}
