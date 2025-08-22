import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/quantity_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 113.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.mainColor, width: 1),
      ),
      child: Stack(
        children: [
          // Main row content
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    bottomLeft: Radius.circular(15.r),
                  ),
                  child: Image.asset(
                    Assets.cartProductImage,
                    width: 120.w,
                    height: 113.h,
                    fit: BoxFit.cover, // prevent stretching
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nike Air Jordon",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontsStyle.medium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.mainColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "EGP 3,500",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontsStyle.medium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(10.r),
                    child: SvgPicture.asset(
                      Assets.deleteIcon,
                      width: 20.w,
                      height: 20.w,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Quantity (bottom-right overlay)
          Positioned(
            right: 8.w,
            bottom: 8.h,
            child: SizedBox(height: 35.h, child: QuantityWidget()),
          ),
        ],
      ),
    );
  }
}
