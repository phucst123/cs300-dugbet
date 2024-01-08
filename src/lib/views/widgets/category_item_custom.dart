import 'package:dugbet/views/pages/category/category_data.dart';
import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryItemCustom extends StatelessWidget {
  final Category category;
  final bool isEvent;

  const CategoryItemCustom(
      {super.key, required this.category, required this.isEvent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.0,
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                    "assets/icons/category/${category.title.toLowerCase()}/${category.icon.toLowerCase()}"),
                const SizedBox(width: 8.0),
                // You can adjust the space between the icon and the title
                Text(category.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(color: Colors.grey),
            GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: 8.0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: category.sub_categories
                  .map((subCategory) => IconItemCustom(subCategory.item1,
                      subCategory.item2, category.title, isEvent))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget IconItemCustom(
      String title, String icon, String category, bool isEvent) {
    return InkWell(
      onTap: () {
        final controller;
        if (!isEvent) {
          controller = Get.find<TransactionController>();
        } else {
          controller = Get.find<EventTransactionController>();
        }

        controller.icon.value = icon;
        controller.category.value = category;
        controller.title.value = title;
        Get.back();
      },
      child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
                "assets/icons/category/${category.toLowerCase()}/${icon.toLowerCase()}"),
            const SizedBox(height: 8.0),
            Expanded(
                child: Center(
                    child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13.0),
            )))
            //SizedBox(height: 8.0)
          ]),
    );
  }
}
