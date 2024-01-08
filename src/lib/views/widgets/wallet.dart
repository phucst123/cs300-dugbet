import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/controllers/home/wallet_controller.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../consts/color/colors.dart';
import 'list_title_wallet.dart';

class Wallet extends GetView<HomeWalletController> {
  const Wallet({super.key, required this.walletList});

  final List<WalletModel> walletList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorPalette.white.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          border: Border.all(color: ColorPalette.white, width: 1)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                const SizedBox(width: 15),
                const Text("Total Balance"),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: controller.onChangeValue,
                    child: Obx(() => controller.showEyeIcon())),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(width: 15),
                Container(
                  height: 40,
                  width: 40,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: ColorPalette.white, width: 2),
                      gradient: const LinearGradient(colors: [
                        ColorPalette.primaryColor,
                        ColorPalette.tertiaryColor
                      ])),
                  child: const Icon(
                    Icons.attach_money,
                    color: ColorPalette.white,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.showBalance(),
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  ),
                ),
                SvgPicture.asset("assets/images/dIcon.svg")
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                const Text("Your wallet:"),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () => Get.toNamed(AppPage.walletPage,
                      arguments: BottomBarEnum.Wallet),
                ),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // itemCount: walletList.length,
                  itemCount: 4,
                  itemBuilder: (context, index) => Row(
                        children: [
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: (){
                              Get.toNamed(AppPage.walletPersonal);
                            },
                            child: Container(
                              width: 320.v,
                              height: 350.h,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: ColorPalette.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: ColorPalette.black, width: 1)),
                              child: const Center(
                                child: ListTitleWallet(
                                    pathImage: "assets/images/defaultPlush.png",
                                    moneyValue: "200.000",
                                    nameWallet: "Momo"),
                              ),
                            ),
                          ),
                        ],
                      )),
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
