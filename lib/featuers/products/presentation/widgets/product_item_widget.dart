import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/utils/dialogs.dart';
import 'package:ecommerce/core/widgets/favourite_icon_widget.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mainColor),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FavouriteIconWidget(),
                ),
              ),
            ],
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
                  direction: Axis.horizontal,
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
                      child: BlocListener<CartCubit, CartState>(
                        listener: (context, state) {
                          if (state is AddToCartSuccess) {
                            Dialogs.successDialog(
                              "Product Added to cart successfully",
                            );
                          } else if (state is AddToCartError) {
                            Dialogs.showMessageDialog(state.message);
                          }
                        },
                        child: InkWell(
                          onTap: () async {
                            context.read<CartCubit>().addToCart(
                              productEntity.id,
                            );
                          },
                          child: SvgPicture.asset(Assets.plusIcon),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
