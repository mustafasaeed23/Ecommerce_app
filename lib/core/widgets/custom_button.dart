import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor,
    this.buttonColor,
    this.borderRadius,
  });
  final void Function() onPressed;
  final String buttonText;
  final Color? textColor;
  final Color? buttonColor;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
        ),
        minimumSize: Size(double.infinity, 50.h),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: FontsStyle.bold.copyWith(
          color: textColor ?? AppColors.mainColor,
          fontSize: 15.r,
        ),
      ),
    );
  }
}
