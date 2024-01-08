import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/views/widgets/double_notch.dart';
import '../../../consts/fonts/text_theme_builder.dart';
import '../../widgets/wallet_header.dart';

class WalletDetail extends StatelessWidget {
  const WalletDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WalletHeader(callback1: (){}, callback2: (){},),
                Text(
                  "Momo",
                  style: TextThemeBuilder.robotoTextTheme.titleLarge,
                ),
                const SizedBox(
                  width: 10,
                ),
                DoubleNotch(),
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
        ),
      ),
    );
  }

  onTapCancel() => Get.back();

  onTapSave() => Get.back();


}
