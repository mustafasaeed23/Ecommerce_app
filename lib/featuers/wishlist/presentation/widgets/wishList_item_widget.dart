import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/favourite_icon_widget.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemWidget extends StatelessWidget {
  const WishlistItemWidget({super.key, required this.entity, required this.wishlistCubit});
  final WishlistProductEntity entity;
  final WishlistCubit wishlistCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 115.h,
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
            child: CachedNetworkImage(
              imageUrl: entity.imageCover,
              width: 120.w,
              height: 113.h,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 120.w,
                height: 113.h,
                color: AppColors.lightBlueColor.withOpacity(0.08),
              ),
              errorWidget: (_, __, ___) => Container(
                width: 120.w,
                height: 113.h,
                color: AppColors.lightBlueColor.withOpacity(0.08),
                alignment: Alignment.center,
                child: Icon(Icons.broken_image, color: AppColors.mainColor),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          entity.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontsStyle.medium.copyWith(
                            color: AppColors.mainColor,
                            fontSize: 18.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const FavouriteIconWidget(isFavourite: true),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "EGP ${entity.price}",
                    style: FontsStyle.medium.copyWith(
                      color: AppColors.mainColor,
                      fontSize: 15.r,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        // TODO: call add-to-cart
                      },
                      borderRadius: BorderRadius.circular(15.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        height: 36.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        alignment: Alignment.center,
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
