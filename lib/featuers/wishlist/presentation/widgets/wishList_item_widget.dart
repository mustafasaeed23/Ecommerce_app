import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/favourite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 113.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.lightBlueColor.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15.r),
            child: Image.asset(
              Assets.shoesImage,
              width: 120.w,
              height: 113.h,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Nike Air Jordon",
                        style: FontsStyle.medium.copyWith(
                          color: AppColors.mainColor,
                          fontSize: 18.r,
                        ),
                      ),
                      Spacer(),
                      FavouriteIconWidget(isFavourite: true),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "EGP 600",
                    style: FontsStyle.medium.copyWith(
                      color: AppColors.mainColor,
                      fontSize: 15.r,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      width: 100.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Center(
                        child: Text(
                          "Add To Cart",
                          style: FontsStyle.bold.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 12.r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
