import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/models/EventModel.dart';
import 'package:dugbet/views/widgets/double_notch_event.dart';
import 'package:dugbet/views/widgets/normal_header_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../consts/fonts/text_theme_builder.dart';

class WalletEventDetail extends StatelessWidget {
  const WalletEventDetail({super.key});

  EventModel get eventData => Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalHeaderBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventData.name,
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DoubleNotchEvent(walletImage: eventData.eventPicture,),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
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
                                "3/Member List",
                                style: TextThemeBuilder
                                    .robotoTextTheme.titleMedium,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: ClipOval(
                              child: Center(
                                child:
                                    SvgPicture.asset("assets/images/momo.svg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StringButton(
                    text: "Cancel".tr,
                    callback: onTapCancel,
                    buttonStyle: CustomButtonStyles.none,
                    decoration: CustomButtonStyles.gradientTealToTealDecoration,
                    width: 140.h,
                  ),
                  StringButton(
                    text: "Save".tr,
                    callback: onTapSave,
                    buttonStyle: CustomButtonStyles.none,
                    decoration: CustomButtonStyles.gradientTealToTealDecoration,
                    width: 140.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() => Get.back();
}
