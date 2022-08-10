import 'package:flutter/material.dart';
import 'package:screens_ui/coffe_shop/models/coffee_type.dart';

class CoffeeTypeLable extends StatelessWidget {
  final CoffeeType coffeeType;
  final VoidCallback onTap;

  const CoffeeTypeLable(
      {Key? key, required this.coffeeType, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: InkWell(
        onTap: onTap,
        child: Text(
          coffeeType.name,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: coffeeType.isSelected ? Colors.orange : Colors.white),
        ),
      ),
    );
  }
}
