import 'package:ecommerce/core/constants/assets.dart';
import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
