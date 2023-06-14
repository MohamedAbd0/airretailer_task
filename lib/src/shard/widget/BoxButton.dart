// ignore_for_file: file_names
import '../../../core/constants/size.dart';
import '../styles.dart';
import '../app_colors.dart';
import 'package:flutter/material.dart';

class BoxButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool busy;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? labelColor;

  const BoxButton({
    Key? key,
    required this.title,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.leading,
    this.backgroundColor,
    this.labelColor,
  })  : outline = false,
        super(key: key);

  const BoxButton.outline({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.backgroundColor,
    this.labelColor,
  })  : disabled = false,
        busy = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantsSize.normalPadding),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          width: double.infinity,
          height: 48,
          alignment: Alignment.center,
          decoration: !outline
              ? BoxDecoration(
                  color: backgroundColor ??
                      (!disabled ? kcPrimaryColor : kcMediumGreyColor),
                  borderRadius:
                      BorderRadius.circular(ConstantsSize.smallcornerRadius),
                )
              : BoxDecoration(
                  color: backgroundColor ?? Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(ConstantsSize.smallcornerRadius),
                  border: Border.all(
                    color: kcPrimaryColor,
                    width: 1,
                  )),
          child: !busy
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) leading!,
                    if (leading != null) const SizedBox(width: 5),
                    Text(
                      title,
                      style: bodyStyle.copyWith(
                        fontWeight:
                            !outline ? FontWeight.bold : FontWeight.w400,
                        color: labelColor ??
                            (!outline ? Colors.white : kcPrimaryColor),
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator(
                  strokeWidth: 8,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
        ),
      ),
    );
  }
}
