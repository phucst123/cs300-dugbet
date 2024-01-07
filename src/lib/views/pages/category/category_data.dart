import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tuple/tuple.dart';

class Category {
  const Category({required this.title, required this.icon, required this.sub_categories});
  final String title;
  final Widget icon;
  final List<Tuple2<String, Widget>> sub_categories;
}

List<Category> categoryData = [
  Category(
    title: 'Food & Beverages',
    icon: SvgPicture.asset("assets/icons/category/fnb/food.svg"),
    sub_categories: [
      Tuple2('Noodles', SvgPicture.asset("assets/icons/category/fnb/noodles.svg")),
      Tuple2('Utensils', SvgPicture.asset("assets/icons/category/fnb/utensils.svg")),
      Tuple2('Pizza', SvgPicture.asset("assets/icons/category/fnb/pizza.svg")),
      Tuple2('Cook', SvgPicture.asset("assets/icons/category/fnb/cook.svg")),
      Tuple2('Drink', SvgPicture.asset("assets/icons/category/fnb/drink.svg")),
      Tuple2('Burger', SvgPicture.asset("assets/icons/category/fnb/burger.svg")),
      Tuple2('Chicken', SvgPicture.asset("assets/icons/category/fnb/chicken.svg")),
      Tuple2('Snack', SvgPicture.asset("assets/icons/category/fnb/snack.svg")),
      Tuple2('Fine dining', SvgPicture.asset("assets/icons/category/fnb/fine_dining.svg")),
      Tuple2('Coffee', SvgPicture.asset("assets/icons/category/fnb/coffee.svg")),
      Tuple2('Grocery', SvgPicture.asset("assets/icons/category/fnb/grocery.svg")),
      Tuple2('Vegetables', SvgPicture.asset("assets/icons/category/fnb/vegetables.svg")),
    ],
  ),
  Category(
    title: 'Transportation',
    icon: SvgPicture.asset("assets/icons/category/transportation/transportation.svg"),
    sub_categories: [
      Tuple2('Suitcase', SvgPicture.asset("assets/icons/category/transportation/suitcase.svg")),
      Tuple2('Map', SvgPicture.asset("assets/icons/category/transportation/map.svg")),
      Tuple2('Earth', SvgPicture.asset("assets/icons/category/transportation/earth.svg")),
      Tuple2('Flight ticket', SvgPicture.asset("assets/icons/category/transportation/flight_ticket.svg")),
      Tuple2('Subway', SvgPicture.asset("assets/icons/category/transportation/subway.svg")),
      Tuple2('Car', SvgPicture.asset("assets/icons/category/transportation/car.svg")),
      Tuple2('Marker', SvgPicture.asset("assets/icons/category/transportation/marker.svg")),
      Tuple2('Taxi', SvgPicture.asset("assets/icons/category/transportation/taxi.svg")),
      Tuple2('Bike', SvgPicture.asset("assets/icons/category/transportation/bike.svg")),
      Tuple2('Parking', SvgPicture.asset("assets/icons/category/transportation/parking.svg")),
      Tuple2('Petrol', SvgPicture.asset("assets/icons/category/transportation/petrol.svg")),
    ],
  ),
  Category(
    title: 'Clothing',
    icon: SvgPicture.asset("assets/icons/category/clothing/tshirt.svg"),
    sub_categories: [
      Tuple2('T-shirt', SvgPicture.asset("assets/icons/category/clothing/tshirt.svg")),
      Tuple2('Washer', SvgPicture.asset("assets/icons/category/clothing/washer.svg")),
      Tuple2('Ear muffs', SvgPicture.asset("assets/icons/category/clothing/ear_muffs.svg")),
      Tuple2('Socks', SvgPicture.asset("assets/icons/category/clothing/socks.svg")),
      Tuple2('Vest', SvgPicture.asset("assets/icons/category/clothing/vest.svg")),
      Tuple2('Hanger', SvgPicture.asset("assets/icons/category/clothing/hanger.svg")),
    ],
  ),
  Category(
    title: 'Others',
    icon: SvgPicture.asset("assets/icons/category/others/package.svg"),
    sub_categories: [
      Tuple2('Shipping', SvgPicture.asset("assets/icons/category/others/shipping.svg")),
      Tuple2('Express shipping', SvgPicture.asset("assets/icons/category/others/express_shipping.svg")),
      Tuple2('24h shipping', SvgPicture.asset("assets/icons/category/others/24h_shipping.svg")),
      Tuple2('Public transport', SvgPicture.asset("assets/icons/category/others/public_transport.svg")),
      Tuple2('Package', SvgPicture.asset("assets/icons/category/others/package.svg")),
    ],
  ),
];
