import 'package:dugbet/views/pages/category/category_data.dart';
import 'package:dugbet/views/pages/category/category_item.dart';
import 'package:flutter/material.dart';


class SearchCategory extends StatefulWidget {
  const SearchCategory({Key? key}) : super(key: key);

  @override
  _SearchCategoryState createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {

  final List<Category> _allCategories = categoryData;

  // This list holds the data for the list view
  List<Category> _foundCategories = [];
  @override
  initState() {

    _foundCategories = _allCategories;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Category> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allCategories;
    } else {
      results = _allCategories
          .where((category) {
            if (category.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
              return true;
            for (var i = 0; i < category.sub_categories.length; i++) {
              if (category.sub_categories[i].item1.toLowerCase().contains(enteredKeyword.toLowerCase())) {
                return true;
              }
            }
            return false;
          })
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundCategories = results;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              labelText: 'Search', suffixIcon: Icon(Icons.search)),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _foundCategories.length,
            //shrinkWrap: true,
            itemBuilder: (context, index) {
              //print("Building item $index");
              return CategoryItem(category: _foundCategories[index]);
            }
          ),
        ),
      ],
    );
  }
}