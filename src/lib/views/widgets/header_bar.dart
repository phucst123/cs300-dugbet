import 'package:dugbet/consts/app_export.dart';
import 'package:dugbet/consts/color/colors.dart';
import 'package:dugbet/views/widgets/button/custom_icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  HeaderBar({super.key});

  final String nameUser = "Lune";

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.tearButton,
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
      ),
      // margin: const EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomIconButton(
              child: Text(
                'Hello, Lune',
                style: context.textTheme.bodyLarge!
                    .merge(const TextStyle(color: ColorPalette.white)),
              ),
              callback: () {},
            ),
            Row(
              children: [
                CustomIconButton(
                    child: SvgPicture.asset(
                      "assets/icons/refresh.svg",
                      colorFilter:
                          ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
                    ),
                    callback: () {}),
                SizedBox(
                  width: 16,
                ),
                CustomIconButton(
                    child: SvgPicture.asset(
                      "assets/icons/notification.svg",
                      colorFilter:
                          ColorFilter.mode(ColorPalette.white, BlendMode.srcIn),
                    ),
                    callback: () {}),
              ],
            )
          ]),
    );
  }
}
