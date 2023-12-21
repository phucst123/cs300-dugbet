import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/home/home_page.dart';
import 'package:dugbet/views/pages/transaction/transaction_page.dart';
import 'package:dugbet/views/pages/splash_page.dart';
import 'package:dugbet/views/pages/wallet/wallet_page.dart';
import 'package:dugbet/views/widgets/group_balance.dart';
import 'package:dugbet/views/widgets/stat.dart';
import 'package:dugbet/views/widgets/stat_one.dart';

import 'package:get/get.dart';

import '../views/pages/input/input.dart';
import '../views/widgets/group_balance_one.dart';

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
        GetPage(
          name: AppPage.scanPage,
          page: () => const Scanning(),
        ),
        GetPage(
          name: AppPage.transactionPage,
          page: () => const TransactionPage(),
        ),
        GetPage(
          name: AppPage.walletPage,
          page: () =>  const WalletPage(),
        ),
      ];
}
