import 'package:dugbet/views/pages/category/search_category.dart';
import 'package:flutter/material.dart';

class ChooseCategoryPage extends StatelessWidget {
  const ChooseCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> page_widgets = [
      Text("Choose a category"),
      SizedBox(height: 6.0),
      SearchCategory()
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Category'),
      ),
      body: Container(
        color: const Color(0xFFB6DDD5),
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0, bottom: 0.0),
        child: ListView.builder(
          itemCount: page_widgets.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return page_widgets[index];
          },
        )
      ),
    );
  }
}