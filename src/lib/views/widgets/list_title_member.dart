import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';

class ListTitleMember extends StatelessWidget {
  const ListTitleMember({super.key, required this.username, required this.email});
  final email;
  final username;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          email,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
      subtitle: Text(
        "$username ",
        style: const TextStyle(
            color: ColorPalette.grey,
            fontWeight: FontWeight.bold,
            fontSize: 10),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon(
              Icons.person,
              color: ColorPalette.black,
            ),
          ),
        ],
      ),
    );
  }
}
