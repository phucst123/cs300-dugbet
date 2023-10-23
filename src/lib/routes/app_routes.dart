import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/splash_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: AppPage.splashPage,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: AppPage.homePage,
          page: () => HomePage(),
        ),
      ];
}
