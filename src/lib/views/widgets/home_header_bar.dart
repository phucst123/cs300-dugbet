import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeaderBar extends StatelessWidget implements PreferredSizeWidget {
  HomeHeaderBar({super.key, this.onTap, required this.leftWidget});

  Function()? onTap;

  // final String nameUser = "Lune";
  final Widget leftWidget;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.header,
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
              callback: () => onTap?.call() ?? () {},
              child: leftWidget,
            ),
            Row(
              children: [
                CustomIconButton(
                    child: SvgPicture.asset(
                      "assets/icons/refresh.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
                    callback: () {}),
                const SizedBox(
                  width: 16,
                ),
                CustomIconButton(
                    child: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      colorFilter: const ColorFilter.mode(
                          ColorPalette.white, BlendMode.srcIn),
                    ),
                    callback: () => Get.toNamed(AppPage.notificationPage)),
              ],
            )
          ]),
    );
  }
}
