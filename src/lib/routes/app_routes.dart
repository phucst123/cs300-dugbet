import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/login/open_page.dart';
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
          name:  AppPage.loginOpenScreen,
          page: () => const LoginOpenScreen()
        ),
        GetPage(
          name: AppPage.loginLoginScreen, 
          page: () => const LoginOpenScreen()
        ),
        GetPage(
          name:  AppPage.loginSignUpScreen,
          page: () => const LoginOpenScreen()
        ),
        GetPage(
          name:  AppPage.loginPasswordScreen,
          page: () => const LoginOpenScreen()
        ),
      ];
}
