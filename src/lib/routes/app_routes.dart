import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/transaction/transaction_page.dart';
import 'package:dugbet/views/pages/category/choose_category_page.dart';
import 'package:dugbet/views/pages/notification/notification_page.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/setttings/edit_notification_page.dart';
import 'package:dugbet/views/pages/setttings/edit_profile_page.dart';
import 'package:dugbet/views/pages/setttings/purchase/premium_page.dart';
import 'package:dugbet/views/pages/setttings/purchase/purchase_page.dart';
import 'package:dugbet/views/pages/setttings/security_page.dart';
import 'package:dugbet/views/pages/setttings/setting_page.dart';
import 'package:dugbet/views/pages/login/login_page.dart';
import 'package:dugbet/views/pages/login/open_page.dart';
import 'package:dugbet/views/pages/login/password.dart';
import 'package:dugbet/views/pages/login/signup_page.dart';
import 'package:dugbet/views/pages/splash/splash_page.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_page.dart';
import 'package:dugbet/views/pages/wallet/wallet_page.dart';

import 'package:get/get.dart';

import '../views/pages/input/input.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: AppPage.transactionHistoryPage,
          page: () => const TransactionHistoryPage(),
        ),
        GetPage(
          name: AppPage.splashPage,
          page: () => SplashPage(),
        ),
        GetPage(
          name: AppPage.homePage,
          page: () => HomePage(),
        ),
        GetPage(
            name: AppPage.loginOpenScreen, page: () => const LoginOpenScreen()),
        GetPage(name: AppPage.loginLoginScreen, page: () => LoginLoginScreen()),
        GetPage(
            name: AppPage.loginSignUpScreen, page: () => LoginSignUpScreen()),
        GetPage(
            name: AppPage.loginPasswordScreen,
            page: () => LoginPasswordScreen()),
        GetPage(
          name: AppPage.settingPage,
          page: () => SettingPage(),
        ),
        GetPage(
          name: AppPage.editProfilePage,
          page: () => const EditProfilePage(),
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
          page: () => const PremiumPage(),
        ),
        GetPage(
          name: AppPage.purchasePage,
          page: () => const PurchasePage(),
        ),
        GetPage(
          name: AppPage.notificationPage,
          page: () => const NotificationPage(),
        ),
        GetPage(
          name: AppPage.transactionPage,
          page: () => const TransactionPage(),
        ),
        GetPage(
          name: AppPage.scanPage,
          page: () => const Scanning(),
        ),
        GetPage(
          name: AppPage.walletPage,
          page: () => const WalletPage(),
        ),
        GetPage(
          name: AppPage.chooseCategoryPage,
          page: () => const ChooseCategoryPage(),
        ),
      ];
}
