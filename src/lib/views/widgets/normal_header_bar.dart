import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NormalHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  NormalHeaderBar({super.key});

  Function()? onTap;

  // final String nameUser = "Lune";

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.white,
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      // margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              callback: () => Get.back(),
              child: Transform.flip(
                flipX: true,
                child: SvgPicture.asset(
                  "assets/icons/arrow.svg",
                  colorFilter: const ColorFilter.mode(
                      ColorPalette.white, BlendMode.srcIn),
                ),
              ),
            ),
            CustomIconButton(
                child: SvgPicture.asset(
                  "assets/icons/notification.svg",
                  colorFilter: const ColorFilter.mode(
                      ColorPalette.white, BlendMode.srcIn),
                ),
                callback: () => Get.toNamed(AppPage.notificationPage))
          ]),
    );
  }
}
