import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/category/search_category.dart';
import 'package:flutter/material.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Category'),
      ),
      body: Container(
        color: ColorPalette.white,
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0, bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose a category",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                    color: ColorPalette.black,
                    letterSpacing: 0.36
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: 6.0),
            Expanded(child: SearchCategory())
          ],
        )
      )
    );
  }
}