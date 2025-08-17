import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.iconPath});
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // color: AppColors.whiteColor,
      ),
      child: SvgPicture.asset(iconPath, width: 40.w, height: 40.h),
    );
  }
}
