import 'package:screens_ui/coffe_shop/models/coffee_type.dart';

import '../models/Coffee_model.dart';

class DataCoffee {
  static final List<CoffeeType> coffeeTypes = [
    CoffeeType(name: 'Cappuccino', isSelected: true),
    CoffeeType(name: 'Galão'),
    CoffeeType(name: 'Latte'),
    CoffeeType(name: 'Americano'),
    CoffeeType(name: 'Macchiato'),
    CoffeeType(name: 'Espresso'),
  ];

  static final List<CoffeeModel> coffeeList = [
    CoffeeModel(
        name: 'capputcino',
        option: 'whipped milk, milk and espresso',
        img: 'assets/coffee_app/capputcino.jpg',
        price: 6.2),
    CoffeeModel(
        name: 'Espresso',
        option: 'Espresso',
        img: 'assets/coffee_app/classic_coffe.jpg',
        price: 2.0),
    CoffeeModel(
        name: 'ice Coffee',
        option: 'Espresso , milk and ice',
        img: 'assets/coffee_app/ice_coffe.jpg',
        price: 7.5),
    CoffeeModel(
        name: 'Latte',
        option: 'whipped milk, milk and espresso',
        img: 'assets/coffee_app/late.jpg',
        price: 6.5),
    CoffeeModel(
        name: 'mocha',
        option: 'whipped cream, milk, espresso',
        img: 'assets/coffee_app/moka.jpg',
        price: 5),
  ];
}
