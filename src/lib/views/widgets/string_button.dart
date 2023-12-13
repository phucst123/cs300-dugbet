import 'package:dugbet/views/widgets/base_button.dart';
import 'package:dugbet/consts/app_export.dart';


class StringButton extends BaseButton {
  const StringButton({super.key, 
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.buttonStyle,
    super.alignment,
    super.buttonTextStyle,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
    required this.callback,
  });

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        height: height ?? 44.v,
        width: width ?? double.maxFinite,
        margin: margin,
        decoration:
            decoration ?? CustomButtonStyles.gradientTealToTealDecoration,
        child: ElevatedButton(
          style: buttonStyle,
          onPressed: callback,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ?? theme.textTheme.titleMedium,
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );

  // Widget get buildElevatedButtonWidget => Container(
  //       height: height ?? 44.v,
  //       width: width ?? double.minPositive,
  //       margin: margin,
  //       // decoration: BoxDecoration(
  //       //   // if isGradient is true, use gradient, else use white color
  //       //   gradient: isGradient ? ColorPalette.primaryGradient : null,
  //       //   borderRadius: BorderRadius.circular(30.v),
  //       // ),
  //       decoration: decoration ?? CustomButtonStyles.gradientTealToTealDecoration,
  //       child: ElevatedButton(
  //         style: buttonStyle,
  //         onPressed: callback,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             leftIcon ?? const SizedBox.shrink(),
  //             Text(
  //               text,
  //               style: TextStyle(
  //                 color: isGradient
  //                     ? ColorPalette.white
  //                     : ColorPalette.defaultText,
  //                 fontSize: 16,
  //                 fontFamily: 'Roboto',
  //                 fontWeight: FontWeight.w400,
  //               ),
  //             ),
  //             rightIcon ?? const SizedBox.shrink(),
  //           ],
  //         ),
  //       ),
  //     );
}
