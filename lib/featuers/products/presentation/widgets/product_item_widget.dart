import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacementNamed(context, Routes.productDetailsScreen),
      child: Container(
        width: 191.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: CachedNetworkImage(
                imageUrl: productEntity.imageCover,
                fit: BoxFit.fitWidth,
                width: 191.w,
                height: 105.h,
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.title,
                    style: FontsStyle.bold.copyWith(
                      fontSize: 14.r,
                      color: AppColors.mainColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    maxLines: 1,
                    productEntity.description,
                    style: FontsStyle.medium.copyWith(
                      fontSize: 12.r,
                      color: AppColors.mainColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.h),

                  PriceWidget(
                    price: productEntity.price,
                    priceAfterDiscount: productEntity.priceAfterDiscount,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        "Review",
                        style: FontsStyle.medium.copyWith(
                          fontSize: 12.r,
                          color: AppColors.mainColor,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "(${productEntity.ratingsAverage})",
                        style: FontsStyle.medium.copyWith(
                          fontSize: 12.r,
                          color: AppColors.mainColor,
                        ),
                      ),
                      SizedBox(width: 3.w),
                      SvgPicture.asset(Assets.starIcon),
                      Spacer(),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(Assets.plusIcon),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
