import 'package:card_swiper/card_swiper.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/controllers/home/home_controller.dart';
import 'package:dugbet/views/widgets/home_header_bar.dart';
import 'package:dugbet/views/widgets/custom_bottom_bar.dart';
import 'package:dugbet/views/widgets/home_category_quickview.dart';
import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/wallet.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        initState: (_) {},
        builder: (controller) {
          controller.getTransactions();
          controller.getWallets();
          List<Widget> quickViewList = [
            // const PieQuickView(),
            Obx(() => StatQuickView(
                  incomeData: controller.displayIncome.value,
                  expenseData: controller.displayExpense.value,
                )),
            TransactionQuickView(
              transactionList: controller.displayTransactionList,
            ),
          ];
          Widget walletRegion = Obx(() {
                        return Wallet(
                          walletData: controller.walletData,
                          balance: controller.balance.value,
                          //walletList: controller.wallet,
                        );
                      });
          print('current list ${controller.transactionlist.length}');
          return SafeArea(
            child: Scaffold(
              // backgroundColor: ColorPalette.expenseText,
              appBar: HomeHeaderBar(
                leftWidget: Text(
                  'Hello ${controller.user.value!.displayName}',
                  style: context.textTheme.bodyLarge!
                      .merge(const TextStyle(color: ColorPalette.white)),
                ),
              ),
              body: Container(
                decoration: const BoxDecoration(color: ColorPalette.tearButton),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Obx(
                            () => DropdownButton<String>(
                              value: controller.selectMode.value,
                              underline: Container(
                                color: Colors.grey,
                                width: 1,
                              ),
                              dropdownColor:
                                  ColorPalette.white.withOpacity(0.9),
                              items: const [
                                DropdownMenuItem(
                                    value: "today", child: Text("Today")),
                                DropdownMenuItem(
                                    value: "week", child: Text("This week")),
                                DropdownMenuItem(
                                    value: "month", child: Text("This month")),
                                DropdownMenuItem(
                                    value: "quarter",
                                    child: Text("This quarter")),
                                DropdownMenuItem(
                                    value: "year", child: Text("This year"))
                              ],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              onChanged: (String? value) =>
                                  controller.onModeClick(value!),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Expanded(
                        child: Swiper(
                          viewportFraction: 0.9,
                          scale: 0.75,
                          itemCount: quickViewList.length,
                          duration: 1000,
                          loop: true,
                          itemHeight: 250,
                          itemWidth: 270,
                          layout: SwiperLayout.TINDER,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            //color: Colors.white,
                            // add border radius
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 1),
                              color: Colors.white,
                              // add box border black corner
                            ),
                            child: quickViewList[index],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                      child: InkWell(
                        onTap: () => Get.toNamed(AppPage.transactionHistoryPage,
                            arguments: BottomBarEnum.Stat),
                        child: Container(
                          height: 44,
                          width: 130,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                ColorPalette.primaryColor,
                                ColorPalette.tertiaryColor
                              ]),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "Analyze",
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: ColorPalette.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: walletRegion
                    )
                  ],
                ),
              ),
              // bottomNavigationBar: _buildBottomAppBar(),
              // floatingActionButton: ScanButton(
              //     height: 60,
              //     width: 57,
              //     onTap: () {},
              //     // color of the floating button

              //     child: CustomImageView(
              //         imagePath: ImageConstant.floatScan,
              //         height: 50.0.v,
              //         width: 22.5.h)),
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              // // add color 0xFF15A69D to the floating action button
              // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
            ),
          );
        });
  }
}
