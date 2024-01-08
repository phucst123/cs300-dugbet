import 'package:dugbet/consts/app_export.dart';

import '../../consts/color/colors.dart';

class EmailDialog extends StatelessWidget {
  EmailDialog({
    super.key,
    required this.resend,
  });

  VoidCallback resend;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text("Email Sent")),
      titleTextStyle: const TextStyle(
        color: ColorPalette.defaultText,
        fontSize: 24,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
      content: const Text(
          "We’ve sent password reset instructions to your mail.",
          textAlign: TextAlign.center),
      contentTextStyle: const TextStyle(
        color: ColorPalette.defaultText,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
      insetPadding: EdgeInsets.symmetric(
        horizontal: 16.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.v),
      ),
      actionsPadding: EdgeInsets.only(bottom: 16.v),
      actions: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StringButton(
                text: "Back to Sign-in",
                buttonStyle: CustomButtonStyles.none,
                width: 188.v,
                callback: () =>
                    Get.offNamedUntil(AppPage.loginScreen, (route) => false),
              ),
              SizedBox(height: 8.v),
              InkWell(
                  child: SizedBox(
                    height: 18.v,
                    child: Text(
                      "Resend the email more",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  onTap: () => resend),
              // ElevatedButton(
              //   child: Text(
              //     "Resend the email more",
              //     style: context.textTheme.bodySmall,
              //   ),
              //   onPressed: () {

              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
