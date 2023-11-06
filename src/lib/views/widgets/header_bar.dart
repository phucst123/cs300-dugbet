import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key,required this.nameUser});
  final String nameUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 40,
          width: 115,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: const Center(child: Text("Hello, Lune")),
        ),
        Row(
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                )),
            const SizedBox(
              width: 20,
            ),
            Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                ))
          ],
        )
      ],
    );
  }
}
