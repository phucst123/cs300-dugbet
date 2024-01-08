import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tuple/tuple.dart';

class Category {
  const Category({required this.title, required this.icon, required this.sub_categories});
  final String title;
  final String icon;
  final List<Tuple2<String, String>> sub_categories;
}

List<Category> categoryData = [
  Category(
    title: 'Fnb',
    icon: "food.svg",
    sub_categories: [
      Tuple2('Noodles', "noodles.svg"),
      Tuple2('Utensils', "utensils.svg"),
      Tuple2('Pizza', "pizza.svg"),
      Tuple2('Cook', "cook.svg"),
      Tuple2('Drink', "drink.svg"),
      Tuple2('Burger', "burger.svg"),
      Tuple2('Chicken', "chicken.svg"),
      Tuple2('Snack', "snack.svg"),
      Tuple2('Fine dining', "fine_dining.svg"),
      Tuple2('Coffee', "coffee.svg"),
      Tuple2('Grocery', "grocery.svg"),
      Tuple2('Vegetables', "vegetables.svg"),
    ],
  ),
  Category(
    title: 'Transportation',
    icon: "transportation.svg",
    sub_categories: [
      Tuple2('Suitcase', "suitcase.svg"),
      Tuple2('Map', "map.svg"),
      Tuple2('Earth', "earth.svg"),
      Tuple2('Flight ticket', "flight_ticket.svg"),
      Tuple2('Subway', "subway.svg"),
      Tuple2('Car', "car.svg"),
      Tuple2('Marker', "marker.svg"),
      Tuple2('Taxi', "taxi.svg"),
      Tuple2('Bike', "bike.svg"),
      Tuple2('Parking', "parking.svg"),
      Tuple2('Petrol', "petrol.svg"),
    ],
  ),
  Category(
    title: 'Clothing',
    icon: "tshirt.svg",
    sub_categories: [
      Tuple2('T-shirt', "tshirt.svg"),
      Tuple2('Washer', "washer.svg"),
      Tuple2('Ear muffs', "ear_muffs.svg"),
      Tuple2('Socks', "socks.svg"),
      Tuple2('Vest', "vest.svg"),
      Tuple2('Hanger', "hanger.svg"),
    ],
  ),
  Category(
    title: 'Others',
    icon: "package.svg",
    sub_categories: [
      Tuple2('Shipping', "shipping.svg"),
      Tuple2('Express shipping', "express_shipping.svg"),
      Tuple2('24h shipping', "24h_shipping.svg"),
      Tuple2('Public transport', "public_transport.svg"),
      Tuple2('Package', "package.svg"),
    ],
  ),
];
