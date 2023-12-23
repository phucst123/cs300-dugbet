import 'package:dugbet/consts/color/colors.dart';
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
    icon: SvgPicture.asset(
                      "assets/icons/category/fnb/food.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
    sub_categories: [
      Tuple2('Noodles', SvgPicture.asset(
                      "assets/icons/category/fnb/noodles.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Utensils', SvgPicture.asset(
                      "assets/icons/category/fnb/utensils.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Pizza', SvgPicture.asset(
                      "assets/icons/category/fnb/pizza.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Cook', SvgPicture.asset(
                      "assets/icons/category/fnb/cook.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Drink', SvgPicture.asset(
                      "assets/icons/category/fnb/drink.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
    ],
  ),
  Category(
    title: 'Transportation',
    icon: SvgPicture.asset(
                      "assets/icons/category/transportation/transportation.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
    sub_categories: [
      Tuple2('Suitcase', SvgPicture.asset(
                      "assets/icons/category/transportation/suitcase.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Map', SvgPicture.asset(
                      "assets/icons/category/transportation/map.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Earth', SvgPicture.asset(
                      "assets/icons/category/transportation/earth.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Flight ticket', SvgPicture.asset(
                      "assets/icons/category/transportation/flight_ticket.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Subway', SvgPicture.asset(
                      "assets/icons/category/transportation/subway.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
    ],
  ),
  Category(
    title: 'Clothing',
    icon: SvgPicture.asset(
                      "assets/icons/category/clothing/tshirt.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
    sub_categories: [
      Tuple2('T-shirt', SvgPicture.asset(
                      "assets/icons/category/clothing/tshirt.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Washer', SvgPicture.asset(
                      "assets/icons/category/clothing/washer.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Ear muffs', SvgPicture.asset(
                      "assets/icons/category/clothing/ear_muffs.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Socks', SvgPicture.asset(
                      "assets/icons/category/clothing/socks.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Vest', SvgPicture.asset(
                      "assets/icons/category/clothing/vest.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Hanger', SvgPicture.asset(
                      "assets/icons/category/clothing/hanger.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
    ],
  ),
  Category(
    title: 'Others',
    icon: SvgPicture.asset(
                      "assets/icons/category/others/package.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
    sub_categories: [
      Tuple2('Shipping', SvgPicture.asset(
                      "assets/icons/category/others/shipping.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Express shipping', SvgPicture.asset(
                      "assets/icons/category/others/express_shipping.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('24h shipping', SvgPicture.asset(
                      "assets/icons/category/others/24h_shipping.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Public transport', SvgPicture.asset(
                      "assets/icons/category/others/public_transport.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
      Tuple2('Package', SvgPicture.asset(
                      "assets/icons/category/others/package.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    )),
    ],
  ),
];
