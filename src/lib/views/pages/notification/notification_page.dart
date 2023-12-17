import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:dugbet/views/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomIconButton(
                child: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    "assets/icons/arrow.svg",
                    colorFilter: const ColorFilter.mode(
                        ColorPalette.white, BlendMode.srcIn),
                  ),
                ),
                callback: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notification",
                  style: context.textTheme.titleLarge!
                      .merge(const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 40,
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: NotificationCard(
                            title: "Budget Target",
                            description: "You reached your target"),
                      );
                    })
              ]),
        ),
      ),
    );
  }
}
