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
  });
  final void Function() onPressed;
  final String buttonText;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
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
