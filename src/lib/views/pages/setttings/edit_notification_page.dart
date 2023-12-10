import 'package:dugbet/consts/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditNotificationPage extends StatelessWidget {
  bool light = true;

  EditNotificationPage({super.key});

  final overlayColor =
      MaterialStateProperty.all<Color>(ColorPalette.primaryColor);
  final trackColor =
      MaterialStateProperty.all<Color>(ColorPalette.secondaryColor);
  final thumbColor = MaterialStateProperty.all<Color>(ColorPalette.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Notification",
              style: context.textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text(
                  "Push Notification",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
              SwitchListTile(
                title: Text(
                  "In-app Notification",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
              SwitchListTile(
                title: Text(
                  "Sound",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
              SwitchListTile(
                title: Text(
                  "Vibrate",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
              SwitchListTile(
                title: Text(
                  "Event Reminder",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
              SwitchListTile(
                title: Text(
                  "Target Reminder",
                  style: context.textTheme.bodyLarge,
                ),
                value: light,
                onChanged: (bool value) {
                  light = value;
                },
                overlayColor: overlayColor,
                trackColor: trackColor,
                thumbColor: thumbColor,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
