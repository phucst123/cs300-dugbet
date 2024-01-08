import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/pages/wallet/wallet_controller.dart';
import 'package:dugbet/views/widgets/list_title_wallet.dart';
import 'package:flutter/material.dart';

import '../../consts/color/colors.dart';
import '../../consts/fonts/text_theme_builder.dart';

class WalletList extends StatelessWidget {
  const WalletList({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final controller = Get.put<WalletController>(WalletController());
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height - 150),
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
              child: Obx(() => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: () {
                                  controller.isWallet.value = true;
                                },
                                child: Text(
                                  "My Wallets",
                                  style: controller.isWallet.value
                                      ? TextThemeBuilder
                                          .robotoTextTheme.titleMedium
                                          ?.copyWith(color: Colors.black)
                                      : TextThemeBuilder
                                          .robotoTextTheme.titleMedium
                                          ?.copyWith(color: Colors.grey),
                                )),
                            Container(
                              color: Colors.grey,
                              width: 2,
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {
                                  controller.isWallet.value = false;
                                },
                                child: Text(
                                  "Trip/Event",
                                  style: controller.isWallet.value
                                      ? TextThemeBuilder
                                          .robotoTextTheme.titleMedium
                                          ?.copyWith(color: Colors.grey)
                                      : TextThemeBuilder
                                          .robotoTextTheme.titleMedium
                                          ?.copyWith(color: Colors.black),
                                )),
                          ],
                        ),
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
                        child: controller.isWallet.value
                            ? ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 8,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                50,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: ColorPalette.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: ListTitleWallet(
                                                  pathImage:
                                                      "assets/images/defaultPlush.png",
                                                  moneyValue: "200.000",
                                                  nameWallet: "Momo"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: 8,
                                itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                50,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                                color: ColorPalette.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: const Center(
                                              child: ListTitleWallet(
                                                  pathImage:
                                                      "assets/images/defaultPlush.png",
                                                  moneyValue: "200.000",
                                                  nameWallet: "Games"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Positioned(
            right: 10,
            bottom: 100,
            child: InkWell(
              onTap: () {
                if(controller.isWallet.value){
                  // Get.toNamed(AppPage.walletNewWallet);
                }
                else{
                  Get.toNamed(AppPage.eventTransaction);
                }
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.orangeAccent, shape: BoxShape.circle),
                child: const Icon(Icons.add),
              ),
            ))
      ],
    );
  }
}
