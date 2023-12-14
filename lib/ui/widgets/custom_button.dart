import 'package:flutter/material.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';

import '../../helpers/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.icon,
      required this.text,
      required this.onTap,
      this.color,
      this.textColor,
      this.isPrimary = true,
      this.isFilled = true,
      this.radius = 20,
      this.customIcon,
      this.useCustomIcon = false,
      this.height = 50})
      : super(key: key);

  final IconData? icon;
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? textColor;
  final bool isPrimary;
  final bool isFilled;
  final double radius;
  final double height;
  // final bool hasBorder;
  final Widget? customIcon;
  final bool useCustomIcon;

  @override
  Widget build(BuildContext context) {
    final useColor =
        color ?? (isPrimary ? AppColors.buttonColor : AppColors.white);
    final useTextColor = textColor ??
        (isFilled
            ? isPrimary
                ? AppColors.normalBlack
                : AppColors.primary
            : AppColors.primary);
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
          side:
              // hasBorder?
              BorderSide(width: 1, color: useColor)
          // : BorderSide.none
          ),
      minWidth: double.infinity,
      height: height,
      color: isFilled ? useColor : null,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              style: context.textTheme.titleSmall?.copyWith(
                  color: useTextColor,
                  fontSize: context.widthPercent(0.04),
                  fontWeight: FontWeight.w600)),
          if (icon != null || customIcon != null)
            const SizedBox(
              width: 10,
            ),
          useCustomIcon
              ? customIcon!
              : icon != null
                  ? Icon(icon,
                      color: isFilled ? AppColors.white : useColor, size: 24)
                  : const SizedBox(),
        ],
      ),
    );
  }
}
