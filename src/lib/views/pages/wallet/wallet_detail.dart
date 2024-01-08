import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/double_notch_custom.dart';
import 'package:dugbet/views/widgets/normal_header_bar.dart';
import '../../../consts/fonts/text_theme_builder.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NormalHeaderBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Momo",
                    style: TextThemeBuilder.robotoTextTheme.titleLarge,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const DoubleNotchCustom(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
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
          ),
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() => Get.back();
}
