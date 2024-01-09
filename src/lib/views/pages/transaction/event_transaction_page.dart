import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/fonts/text_theme_builder.dart';
import 'package:dugbet/views/pages/transaction/event_transaction_controller.dart';
import 'package:dugbet/views/pages/transaction/transaction_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../widgets/event_double_notch.dart';

// ignore: must_be_immutable
class EventTransactionPage extends StatelessWidget {
  EventTransactionPage({super.key});
  EventTransactionController? controller;

  @override
  Widget build(BuildContext context) {

    if(Get.isRegistered<EventTransactionController>()){
      controller = Get.find<EventTransactionController>();
    }
    else{
      controller = Get.put<EventTransactionController>(EventTransactionController());
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EventDoubleNotch(),
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
                          style: TextThemeBuilder.robotoTextTheme.headlineLarge,
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
                                      .format(controller!.selectedDate.value)
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
                Container(
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
                              "Members",
                              style: TextThemeBuilder
                                  .robotoTextTheme.headlineLarge,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "3/Member list",
                              style:
                              TextThemeBuilder.robotoTextTheme.titleMedium,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            controller!.chooseMembers();
                          },
                          child: ClipOval(
                            child: Center(
                              child: SvgPicture.asset("assets/images/momo.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 50,
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
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  onTapCancel() {
    Get.back();
    Get.delete<TransactionController>();
  }

  onTapSave() => Get.back();
}
