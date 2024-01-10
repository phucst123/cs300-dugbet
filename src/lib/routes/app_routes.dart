import 'package:dugbet/bindings/transaction/transaction_binding.dart';
import 'package:dugbet/bindings/wrapper/wrapper_binding.dart';
import 'package:dugbet/controllers/login/login_controller.dart';
import 'package:dugbet/controllers/login/password_controller.dart';
import 'package:dugbet/controllers/login/signup_controller.dart';
import 'package:dugbet/controllers/setting/edit_profile_controller.dart';
import 'package:dugbet/routes/app_pages.dart';
import 'package:dugbet/views/pages/wrapper/wrapper_page.dart';
import 'package:dugbet/views/pages/transaction/transaction_page.dart';
import 'package:dugbet/views/pages/category/choose_category_page.dart';
import 'package:dugbet/views/pages/notification/notification_page.dart';

// import 'package:dugbet/views/pages/home/home_page.dart';
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
import 'package:dugbet/views/pages/wallet/wallet_detail.dart';
import 'package:dugbet/views/pages/wallet/wallet_event.dart';
import 'package:dugbet/views/pages/wallet/wallet_event_detail.dart';
import 'package:dugbet/views/pages/wallet/wallet_new_wallet_real.dart';

// import 'package:dugbet/views/pages/wallet/wallet_new_wallet.dart';
import 'package:dugbet/views/pages/wallet/wallet_page.dart';
import 'package:dugbet/views/pages/wallet/wallet_personal.dart';

import 'package:get/get.dart';

import '../views/pages/input/scanPage.dart';
import '../views/pages/transaction/event_transaction_page.dart';

class AppRoute {
  static List<GetPage> routes() => [
        GetPage(
          name: AppPage.transactionHistoryPage,
          page: () => TransactionHistoryPage(
            showNav: true,
          ),
          binding: TransactionBinding(),
        ),
        GetPage(
          name: AppPage.splashPage,
          page: () => SplashPage(),
        ),
        GetPage(
            name: AppPage.homePage,
            page: () => const MainWrapper(),
            // transition: Transition.leftToRight
            binding: WrapperBinding()),
        GetPage(
          name: AppPage.loginOpenScreen,
          page: () => const LoginOpenScreen(),
        ),
        GetPage(
            name: AppPage.loginScreen,
            page: () => const LoginScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<LoginController>(() => LoginController());
            })),
        GetPage(
            name: AppPage.loginSignUpScreen,
            page: () => const LoginSignUpScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<SignupController>(() => SignupController());
            })),
        GetPage(
            name: AppPage.loginPasswordScreen,
            page: () => const LoginPasswordScreen(),
            binding: BindingsBuilder(() {
              Get.lazyPut<PasswordController>(() => PasswordController());
            })),
        GetPage(
          name: AppPage.settingPage,
          page: () => SettingPage(showNav: true),
        ),
        GetPage(
          name: AppPage.editProfilePage,
          page: () => const EditProfilePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<EditProfileController>(() => EditProfileController());
          }),
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
          page: () => TransactionPage(),
        ),
        GetPage(
          name: AppPage.scanPage,
          page: () => Scanning(),
        ),
        GetPage(
          name: AppPage.walletPage,
          page: () => const WalletPage(showNav: true),
        ),
        GetPage(
          name: AppPage.chooseCategoryPage,
          page: () => const ChooseCategoryPage(),
        ),
        GetPage(
          name: AppPage.walletEvent,
          page: () => WalletEvent(
            eventModel: Get.arguments,
          ),
        ),
        GetPage(
          name: AppPage.walletPersonal,
          page: () => WalletPersonal(
            walletData: Get.arguments,
          ),
        ),
        GetPage(
          name: AppPage.walletDetail,
          page: () => WalletDetail(
            walletData: Get.arguments,
          ),
        ),
        GetPage(
          name: AppPage.walletEventDetail,
          page: () => WalletEventDetail(
            eventData: Get.arguments,
          ),
        ),
        // GetPage(
        //   name: AppPage.walletNewEvent,
        //   page: () => const WalletNewEvent(),
        // ),
        GetPage(
            name: AppPage.walletNewWallet, page: () => const WalletNewEvent()),
        GetPage(
          name: AppPage.eventTransaction,
          page: () => EventTransactionPage(),
        ),
      ];
}
