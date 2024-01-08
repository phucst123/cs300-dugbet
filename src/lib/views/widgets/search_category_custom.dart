import 'package:dugbet/views/pages/category/category_data.dart';
import 'package:dugbet/views/widgets/category_item_custom.dart';
import 'package:flutter/material.dart';


class SearchCategoryCustom extends StatelessWidget {
  const SearchCategoryCustom({super.key, required this.isEvent});
  final bool isEvent;

  @override
  Widget build(BuildContext context) {
    final List<Category> allCategories = categoryData;
    return Scaffold(
      body: ListView.builder(
          itemCount: allCategories.length,
          //shrinkWrap: true,
          itemBuilder: (context, index) {
            //print("Building item $index");
            return CategoryItemCustom(category: allCategories[index],isEvent: isEvent,);
          }),
    );
  }
}



