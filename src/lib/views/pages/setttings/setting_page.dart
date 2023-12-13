import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/widgets/button/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: SvgPicture.asset("assets/user/user.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Anomyous",
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  "youremail@email.com",
                  style: context.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListTile(
                leading: SvgPicture.asset("assets/icons/profile.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Edit Profile",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.editProfilePage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/notification.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Notifications",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.editNotificationPage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/appearance.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Appearance",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/security.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Security",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.securityPage),
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/policy.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Privacy Policy",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/help.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Contact Us",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
              ),
              ListTile(
                leading: SvgPicture.asset("assets/icons/crown.svg"),
                trailing: SvgPicture.asset("assets/icons/arrow.svg"),
                title: const Text(
                  "Premium",
                ),
                titleTextStyle: context.textTheme.bodyLarge,
                onTap: () => Get.toNamed(AppPage.premiumPage),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: NormalButton(title: "Logout", callback: () => {}),
          ),
          const SizedBox(
            height: 98,
          ),
        ],
      ),
    );
  }
}
