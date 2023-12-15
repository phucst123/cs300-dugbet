import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/login/login_page.dart';
import 'package:dugbet/views/pages/login/open_page.dart';
import 'package:dugbet/views/pages/login/password.dart';
import 'package:dugbet/views/pages/login/signup_page.dart';
import 'package:dugbet/views/pages/splash/splash_page.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_history_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: AppPage.transactionHistoryPage,
          page: () => TransactionHistoryPage(),
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
          name:  AppPage.loginOpenScreen,
          page: () => const LoginOpenScreen()
        ),
        GetPage(
          name: AppPage.loginLoginScreen, 
          page: () => LoginLoginScreen()
        ),
        GetPage(
          name:  AppPage.loginSignUpScreen,
          page: () => LoginSignUpScreen()
        ),
        GetPage(
          name:  AppPage.loginPasswordScreen,
          page: () => LoginPasswordScreen()
        ),
      ];
}
