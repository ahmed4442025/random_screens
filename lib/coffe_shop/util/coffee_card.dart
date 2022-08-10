import 'package:flutter/material.dart';

import '../models/Coffee_model.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeModel coffee;

  CoffeeCard({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey.shade800, Colors.grey.shade900],
            ),
            color: Colors.black54,
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(15),
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.asset(
                    coffee.img,
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                  // rate
                  Positioned(
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.5),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25))),
                        width: 60,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star_rate_rounded, color: Color(0xffD17842),),
                            Text(coffee.rate.toString())
                          ],
                        ),
                      ))
                ],
              ),
            ),
            // details
            SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    coffee.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    coffee.option,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // add to card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "\$ ",
                        style: TextStyle(fontSize: 20, color: Color(0xffFF9800)),
                        maxLines: 1,
                      ),
                      Text(
                        coffee.price.toString(),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xffcc8811),
                      ),
                      width: 30,
                      height: 30,
                      child: const Icon(Icons.add)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
