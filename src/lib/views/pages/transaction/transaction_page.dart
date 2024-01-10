import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import 'package:dugbet/views/widgets/normal_header_bar.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TransactionPage extends StatelessWidget {
  TransactionPage({super.key});

  TransactionController? controller;

  @override
  Widget build(BuildContext context) {
    if (Get.isRegistered<TransactionController>()) {
      controller = Get.find<TransactionController>();
    } else {
      controller = Get.put<TransactionController>(TransactionController());
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NormalHeaderBar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle:
                              TextThemeBuilder.robotoTextTheme.titleLarge,
                        ),
                        controller: controller?.titleTextEdit,
                        style: TextThemeBuilder.robotoTextTheme.titleLarge,
                      ),
                      DoubleNotch(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: 360,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Time",
                                style: TextThemeBuilder
                                    .robotoTextTheme.headlineLarge,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Text(
                                        "${controller!.selectedTime.value.hour}:${controller!.selectedTime.value.minute}",
                                        style: TextThemeBuilder
                                            .robotoTextTheme.titleMedium),
                                    onTap: () {
                                      controller!.chooseTime();
                                    },
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    child: Text(
                                        DateFormat("dd:MMM:yyyy")
                                            .format(
                                                controller!.selectedDate.value)
                                            .toString(),
                                        style: TextThemeBuilder
                                            .robotoTextTheme.titleMedium),
                                    onTap: () {
                                      controller!.chooseDate();
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: controller!.chooseWallet,
                        child: Container(
                          height: 80,
                          width: 360,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Wallet",
                                      style: TextThemeBuilder
                                          .robotoTextTheme.headlineLarge,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      controller!.selectedWallet.value,
                                      style: TextThemeBuilder
                                          .robotoTextTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                ClipOval(
                                  child: Center(
                                    child: Image.asset(
                                        "assets/Bank/${controller!.selectedWallet.toLowerCase()}.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   height: 40,
                      //   width: MediaQuery.of(context).size.width,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.grey, width: 1),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20),
                      //     child: Row(
                      //       children: [
                      //         Text(
                      //           "Show more details",
                      //           style: TextThemeBuilder.robotoTextTheme.labelLarge,
                      //         ),
                      //         const Spacer(),
                      //         IconButton(
                      //             onPressed: () {},
                      //             icon: const Icon(Icons.keyboard_arrow_down))
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      // Container(
                      //   height: 44,
                      //   width: 140,
                      //   decoration: BoxDecoration(
                      //       color: LightTheme.primaryColor,
                      //       borderRadius: BorderRadius.circular(25)
                      //   ),

                      //   child: Center(child: Text("Save",style: TextThemeBuilder.robotoTextTheme.headlineLarge,)),
                      // )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StringButton(
                      text: "Cancel".tr,
                      callback: onTapCancel,
                      buttonStyle: CustomButtonStyles.none,
                      decoration:
                          CustomButtonStyles.gradientTealToTealDecoration,
                      width: 140.h,
                    ),
                    StringButton(
                      text: "Save".tr,
                      callback: onTapSave,
                      buttonStyle: CustomButtonStyles.none,
                      decoration:
                          CustomButtonStyles.gradientTealToTealDecoration,
                      width: 140.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapCancel() {
    Get.back();
    Get.delete<TransactionController>();
  }

  onTapSave() {
    print("In onTapSave() of TransactionPage");
    controller!.pushToFirestore().then((_) {
      Get.back();
    });
  }
}
