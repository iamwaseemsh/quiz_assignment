import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ignore: must_be_immutable
class ContinueButton extends StatelessWidget {
  ContinueButton({Key? key, required this.text, required this.onPressed, this.loadingNotifier, this.isEnabledNotifier, this.backgroundColor}) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final ValueNotifier<bool>? loadingNotifier;
  final Color? backgroundColor;
  ValueNotifier<bool>? isEnabledNotifier;

  @override
  Widget build(BuildContext context) {
    if (loadingNotifier == null) {
      return ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(backgroundColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            text,
            style: Theme.of(context).textTheme.button!.copyWith(color: Colors.white),
          ),
        ),
        onPressed: onPressed,
      );
    }

    isEnabledNotifier ??= ValueNotifier(true);

    return ValueListenableBuilder<bool>(
      valueListenable: isEnabledNotifier!,
      builder: (context, isEnabled, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: loadingNotifier!,
          builder: (context, isLoading, child) {
            return ElevatedButton(
              child: (isLoading)
                  ? CircularProgressIndicator.adaptive(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).scaffoldBackgroundColor),
                    )
                  : Text(text, style: Theme.of(context).textTheme.button),
              onPressed: shouldButtonBeEnabled(isEnabled, isLoading) ? onPressed : null,
            );
          },
        );
      },
    );
  }

  bool shouldButtonBeEnabled(bool isEnabled, bool isLoading) => isEnabled && !isLoading;
}
