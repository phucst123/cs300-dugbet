import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/views/widgets/list_title_wallet.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';
import '../../../controllers/wallet/wallet_controller.dart';

// ignore: must_be_immutable
class WalletList extends StatelessWidget {
  WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    WalletController controller;
    if (Get.isRegistered<WalletController>()) {
      controller = Get.find<WalletController>();
    } else {
      controller = Get.put<WalletController>(WalletController());
    }

    return GetBuilder<WalletController>(
        // init: WalletController(),
        // initState: (_) {},
        builder: (controller) {
      return Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 150),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: ColorPalette.white.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            border: Border.all(color: ColorPalette.white, width: 2)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(bottom: keyboardSpace + 80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.switchMode(true);
                            controller.isWallet.value = true;
                          },
                          child: Text(
                            "My Wallets",
                            style: TextThemeBuilder.robotoTextTheme.titleMedium
                                ?.copyWith(
                                    color: controller.onPersonal.value
                                        ? Colors.black
                                        : Colors.grey),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              controller.switchMode(false);
                              controller.isWallet.value = false;
                            },
                            child: Text(
                              "Trip/Event",
                              style: TextThemeBuilder
                                  .robotoTextTheme.titleMedium
                                  ?.copyWith(
                                      color: controller.onPersonal.value
                                          ? Colors.grey
                                          : Colors.black),
                            )),
                      ],
                    );
                  }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    style: TextThemeBuilder.robotoTextTheme.titleSmall,
                    decoration: InputDecoration(
                        // fillColor:LightTheme.primaryColor,
                        // filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none),
                        hintText: "Search your wallet...",
                        hintStyle: TextStyle(
                            color: ColorPalette.grey.withOpacity(0.7),
                            fontWeight: FontWeight.normal),
                        prefixIcon: const Icon(Icons.search)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - 170,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.walletList.length,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: ColorPalette.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    //child: ListTitleWallet(pathImage: "assets/images/defaultPlush.png",moneyValue: "200.000", nameWallet: "Momo"),
                                    child: InkWell(
                                      onTap: () => controller.onPersonal.value
                                          ? Get.toNamed(AppPage.walletPersonal,
                                              arguments:
                                                  controller.walletList[index])
                                          : Get.toNamed(AppPage.walletEvent,
                                              arguments:
                                                  controller.eventList[index]),
                                      child: Obx(() {
                                        return controller.onPersonal.value
                                            ? ListTitleWallet(
                                                pathImage: controller
                                                    .walletList[index]
                                                    .walletPicture,
                                                moneyValue: convertToCurrency(
                                                    controller.walletList[index]
                                                        .balance),
                                                nameWallet: controller
                                                    .walletList[index].name)
                                            : ListTitleWallet(
                                                pathImage: controller
                                                    .eventList[index]
                                                    .eventPicture,
                                                moneyValue: convertToCurrency(
                                                    controller.walletList[index]
                                                        .balance),
                                                nameWallet: controller
                                                    .eventList[index].name);
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
