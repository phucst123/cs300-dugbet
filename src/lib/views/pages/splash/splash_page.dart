import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/controllers/splash/loading_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../consts/color/colors.dart';

class SplashPage extends StatelessWidget {
  final splashScreenController = Get.find<LoadingController>();

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: const Alignment(0.5, 0),
                end: const Alignment(0.5, 1),
                colors: [appTheme.green200, appTheme.blue100])),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 151,
            ),
            const Text(
              "Dugbet",
              style: TextStyle(
                color: ColorPalette.defaultText,
                fontSize: 36,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Your Financial Compass",
              style: TextStyle(
                color: ColorPalette.defaultText,
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
              ),
            ),
            SvgPicture.asset(
              "assets/images/logo.svg",
              height: 300,
            ),
            const SizedBox(
              height: 64,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child:
                  Lottie.asset("assets/lottie/loading.json", fit: BoxFit.cover),
            ),
          ]),
        ),
      ),
    );
  }
}
