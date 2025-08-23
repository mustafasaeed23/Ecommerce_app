import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/quantity_widget.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/delete_item_from_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.cartItemEntity,
    required this.cartCubit,
  });

  final CartItemEntity cartItemEntity;
  final CartCubit cartCubit;

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
                  child: CachedNetworkImage(
                    imageUrl: cartItemEntity.product.imageCover,
                    fit: BoxFit.cover,
                    height: 113.h,
                    width: 120.w,
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
                          cartItemEntity.product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: FontsStyle.medium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.mainColor,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "EGP ${cartItemEntity.price}",
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
                DeleteItemFromCartWidget(
                  cartCubit: cartCubit,
                  cartItemEntity: cartItemEntity,
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            bottom: 8.h,
            child: SizedBox(
              height: 35.h,
              child: QuantityWidget(
                cartItemCount: cartItemEntity.count.toString(),
                decrementCart: () {
                  if (cartItemEntity.count > 1) {
                    cartCubit.updateCart(
                      cartItemEntity.product.sId,
                      cartItemEntity.count - 1,
                    );
                  }
                },
                incrementCart: () => cartCubit.updateCart(
                  cartItemEntity.product.sId,
                  cartItemEntity.count + 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
