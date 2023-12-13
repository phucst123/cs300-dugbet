import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/setttings/edit_notification_page.dart';
import 'package:dugbet/views/pages/setttings/edit_profile_page.dart';
import 'package:dugbet/views/pages/setttings/purchase/premium_page.dart';
import 'package:dugbet/views/pages/setttings/purchase/purchase_page.dart';
import 'package:dugbet/views/pages/setttings/security_page.dart';
import 'package:dugbet/views/pages/setttings/setting_page.dart';
import 'package:dugbet/views/pages/splash/splash_page.dart';

import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: AppPage.splashPage,
          page: () => SplashPage(),
        ),
        GetPage(
          name: AppPage.homePage,
          page: () => HomePage(),
        ),
        GetPage(
          name: AppPage.settingPage,
          page: () => SettingPage(),
        ),
        GetPage(
          name: AppPage.editProfilePage,
          page: () => EditProfilePage(),
        ),
        GetPage(
          name: AppPage.editNotificationPage,
          page: () => EditNotificationPage(),
        ),
        GetPage(
          name: AppPage.securityPage,
          page: () => SecurityPage(),
        ),
        GetPage(
          name: AppPage.premiumPage,
          page: () => PremiumPage(),
        ),
        GetPage(
          name: AppPage.purchasePage,
          page: () => PurchasePage(),
        ),
      ];
}
