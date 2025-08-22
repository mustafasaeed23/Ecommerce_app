import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.cartButtonIcon),
          SizedBox(width: 12.w),
          Text(
            "Add To Cart",
            style: FontsStyle.medium.copyWith(
              fontSize: 16.r,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
