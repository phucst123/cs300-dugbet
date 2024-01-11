import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/utils/function_utils.dart';
import 'package:dugbet/models/WalletModel.dart';
import 'package:dugbet/views/widgets/double_notch_personal.dart';
import 'package:dugbet/views/widgets/normal_header_bar.dart';
import '../../../consts/fonts/text_theme_builder.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({super.key, required this.walletData});
  final WalletModel walletData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NormalHeaderBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          walletData.name,
                          style: TextThemeBuilder.robotoTextTheme.titleLarge,
                        ),
                        
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DoubleNotchPersonal(
                      walletImage: walletData.walletPicture,
                      amount: convertToCurrency(walletData.initialAmount),
                      description: walletData.description,
                      
                    ),
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
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() => Get.back();
}
