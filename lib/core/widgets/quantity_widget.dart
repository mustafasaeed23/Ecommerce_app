import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 122.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.remove_circle_outline_outlined,
            color: AppColors.whiteColor,
          ),
          Text(
            "1",
            style: FontsStyle.bold.copyWith(
              fontSize: 16.r,
              color: AppColors.whiteColor,
            ),
          ),
          Icon(Icons.add_circle_outline_outlined, color: AppColors.whiteColor),
        ],
      ),
    );
  }
}
