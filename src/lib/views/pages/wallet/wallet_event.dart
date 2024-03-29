import 'package:dugbet/controllers/wallet/wallet_controller.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/views/pages/transaction_history/transaction_template.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:dugbet/views/widgets/group_balance_one.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:dugbet/views/widgets/member_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../consts/color/colors.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../../firebase_ref/references.dart';
import '../../widgets/bottom_sheet_transaction.dart';

class WalletEvent extends StatelessWidget {
  WalletEvent({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeHeaderBar(
          leftWidget: Transform.flip(
            flipX: true,
            child: SvgPicture.asset(
              "assets/icons/arrow.svg",
              colorFilter:
                  const ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
            ),
          ),
          onTap: () {
            Get.back();
          },
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: ColorPalette.tearButton),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12.0, bottom: 20.0, left: 16.0),
                  child: Row(
                    children: [
                      Text(
                        eventModel.name,
                        style: TextThemeBuilder.robotoTextTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        "assets/icons/edit.svg",
                      ),
                    ],
                  ),
                ),
                GroupBalanceOne(
                  eventData: eventModel,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomIconButton(
                        child: SvgPicture.asset(
                          "assets/icons/edit.svg",
                          colorFilter: const ColorFilter.mode(
                              ColorPalette.white, BlendMode.srcIn),
                        ),
                        callback: () {}),
                    CustomIconButton(
                        child: SvgPicture.asset(
                          "assets/icons/logout.svg",
                          colorFilter: const ColorFilter.mode(
                              ColorPalette.white, BlendMode.srcIn),
                        ),
                        callback: () {
                          print("Leave event here");
                        }),
                    CustomIconButton(
                        child: SvgPicture.asset(
                          "assets/icons/people.svg",
                          colorFilter: const ColorFilter.mode(
                              ColorPalette.white, BlendMode.srcIn),
                        ),
                        callback: () {
                          Get.dialog(SafeArea(
                            minimum: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 100),
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              body: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: const MemberList()),
                            ),
                          ));
                        }),
                    CustomIconButton(
                        child: SvgPicture.asset(
                          "assets/icons/admin.svg",
                          colorFilter: const ColorFilter.mode(
                              ColorPalette.white, BlendMode.srcIn),
                        ),
                        callback: () async {
                          var members = eventModel.members;
                          for (int i = 0; i < members.length; i++) {
                            var member = members[i];
                            String? user_id = member.id;
                            String? user_name = eventModel.id;
                            DateTime now = DateTime.now();
                            await usersRef
                                .doc(user_id)
                                .collection('Transactions')
                                .add({
                              'amount':
                                  eventModel.initialAmount / members.length,
                              'category': "Transportation",
                              'date': DateTime.now(),
                              'description':
                                  "Split money for event ${user_name}",
                              'isIncome': false,
                              'payerId': user_id,
                              'subCategory': "market",
                              'title': "Market",
                              'transactionId':
                                  '${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-${now.second}-${user_id}',
                              'type': 'Personal',
                              'walletId': eventModel.initialAmount
                              //chưa xác định được
                            });

                            await usersRef
                                .doc(user_id)
                                .collection("Events")
                                .doc(eventModel.id)
                                .delete();
                          }
                          Get.snackbar("Event", "Split Event successfully");
                          WalletController controller;
                          if (Get.isRegistered<WalletController>()) {
                            controller = Get.find<WalletController>();
                          } else {
                            controller =
                                Get.put<WalletController>(WalletController());
                          }
                          controller.getEvents();
                          // controller.getWallets();
                          Get.back();
                        }),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                BottomSheetTransaction(
                  transaction_list: _transaction_list,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<TransactionTemplate> _transaction_list = [
    TransactionTemplate(
        category: "Transportation",
        title: "Moving",
        description: "A lot of stuff",
        amount: 456,
        date: DateTime.now(),
        icon: "suitcase",
        type: 0),
    TransactionTemplate(
        category: "Food and Beverages",
        title: "Burger",
        description: "Lunch time",
        amount: 123000,
        date: DateTime.now(),
        icon: "burger",
        type: 0),
  ];
}
