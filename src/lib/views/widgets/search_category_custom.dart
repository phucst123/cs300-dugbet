import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/pages/category/category_data.dart';
import 'package:dugbet/views/pages/category/category_item.dart';
import 'package:flutter/material.dart';


class SearchCategoryCustom extends StatelessWidget {
  const SearchCategoryCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> allCategories = categoryData;
    return Scaffold(
      body: ListView.builder(
          itemCount: allCategories.length,
          //shrinkWrap: true,
          itemBuilder: (context, index) {
            //print("Building item $index");
            return CategoryItem(category: allCategories[index]);
          }),
    );
  }
}



