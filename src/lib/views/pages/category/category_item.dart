import 'package:dugbet/views/pages/category/category_data.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                category.icon,
                SizedBox(width: 8.0), // You can adjust the space between the icon and the title
                Text(category.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(color: Colors.grey),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              children: category.sub_categories.map((subCategory) => IconItem(subCategory.item1, subCategory.item2)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget IconItem(String title, Widget icon) {
    return Column(
      children:[
        icon,
        Text(title)
      ]
    );
  }
}
