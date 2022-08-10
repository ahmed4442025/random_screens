import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screens_ui/coffe_shop/data/data.dart';
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
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        // app bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
          ),
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
              SizedBox(
                height: 15,
              ),
              // search bar
              TextSearch(),
              SizedBox(
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
              SizedBox(
                height: 15,
              ),
              // coffee offers

            ],
          ),
        ),

        // bottomNavigationBar
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.grey.shade800,
          backgroundColor: Colors.grey.shade900,
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
