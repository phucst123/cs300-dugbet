import 'package:dugbet/consts/app_export.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({
    super.key,
    this.alignment,
    this.onTap,
    this.width,
    this.height,
    this.child,
  });

  final Alignment? alignment;


  final VoidCallback? onTap;

  final double? width;

  final double? height;


  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        onPressed: onTap,
        // add color 0xff15A69D to background
        backgroundColor: appTheme.teal400,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.h),
        ),
        
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: 
              BoxDecoration(
                borderRadius: BorderRadius.circular(28.h),
                gradient: LinearGradient(
                  begin: const Alignment(0.0, 0),
                  end: const Alignment(1.0, 0),
                  colors: [
                    appTheme.teal400,
                    appTheme.teal40001,
                  ],
                ),
              ),
          child: child,
        ),
      );
}
