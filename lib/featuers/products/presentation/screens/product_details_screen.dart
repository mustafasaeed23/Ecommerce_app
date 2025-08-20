import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/add_to_cart_widget.dart';
import 'package:ecommerce/core/widgets/quantity_widget.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/price_widget.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/product_carsouel_widget.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! ProductEntity) {
      return const Scaffold(body: Center(child: Text('Product not provided')));
    }
    final product = args;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(Assets.arrowBackIcon),
          ),
        ),
        title: Text(
          "Product Details",
          style: FontsStyle.bold.copyWith(
            fontSize: 16.r,
            color: AppColors.mainColor,
          ),
        ),
        centerTitle: true,
        actions: [
          SvgPicture.asset(Assets.searchIcon),
          SizedBox(width: 10.w),
          SvgPicture.asset(Assets.cartIcon),
          SizedBox(width: 15.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageCarousel(imageUrls: product.images),
            SizedBox(height: 15.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    product.title,
                    style: FontsStyle.medium.copyWith(
                      fontSize: 18.r,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                Spacer(),
                PriceWidget(
                  price: product.price,
                  priceAfterDiscount: product.priceAfterDiscount,
                  direction: Axis.vertical,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              children: [
                Container(
                  width: 102.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.mainColor, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "${product.sold.toString()} Sold",
                      style: FontsStyle.medium.copyWith(
                        fontSize: 12.r,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset(Assets.starIcon),
                SizedBox(width: 5.w),
                Text(
                  product.ratingsAverage.toString(),
                  style: FontsStyle.medium.copyWith(
                    fontSize: 14.r,
                    color: AppColors.mainColor,
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  "(${product.ratingsQuantity.toString()})",
                  style: FontsStyle.medium.copyWith(
                    fontSize: 14.r,
                    color: AppColors.mainColor,
                  ),
                ),
                Spacer(),
                QuantityWidget(),
              ],
            ),
            SizedBox(height: 15.h),
            Text(
              "Description",
              style: FontsStyle.medium.copyWith(
                fontSize: 18.r,
                color: AppColors.mainColor,
              ),
            ),
            SizedBox(height: 10.h),
            ReadMoreText(
              product.description,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimCollapsedText: '  See more',
              trimExpandedText: '  See less',
              style: FontsStyle.regular.copyWith(
                fontSize: 14.r,
                color: AppColors.mainColor,
              ),
              moreStyle: FontsStyle.medium.copyWith(
                fontSize: 14.r,
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              lessStyle: FontsStyle.medium.copyWith(
                fontSize: 14.r,
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Price",
                      style: FontsStyle.medium.copyWith(
                        fontSize: 18.r,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "EGP 3500",
                      style: FontsStyle.medium.copyWith(
                        fontSize: 18.r,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 15.w),
                Expanded(child: AddToCartWidget()),
              ],
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
