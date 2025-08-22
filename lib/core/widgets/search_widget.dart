import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            width: 348.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              border: Border.all(color: AppColors.mainColor, width: 1.w),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.searchIcon),
                  SizedBox(width: 10.w),
                  Text(
                    "what do you search for?",
                    style: FontsStyle.regular.copyWith(
                      fontSize: 14.r,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.cartScreen),
            child: SvgPicture.asset(Assets.cartIcon),
          ),
        ),
      ],
    );
  }
}
