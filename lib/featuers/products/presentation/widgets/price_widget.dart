import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';

class PriceWidget extends StatelessWidget {
  final int price;
  final int priceAfterDiscount;

  const PriceWidget({
    super.key,
    required this.price,
    required this.priceAfterDiscount,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount = priceAfterDiscount > 0 && priceAfterDiscount < price;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Show discounted price if available, otherwise the normal price
        Text(
          "EGP ${hasDiscount ? priceAfterDiscount : price}",
          style: FontsStyle.medium.copyWith(
            fontSize: 15.r,
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        ),

        // If discount exists, show old price with line-through
        if (hasDiscount) ...[
          SizedBox(width: 6.w),
          Text(
            "EGP $price",
            style: FontsStyle.medium.copyWith(
              fontSize: 13.r,
              color: Colors.grey,
              decoration: TextDecoration.lineThrough, // 👈 line on the old price
            ),
          ),
        ],
      ],
    );
  }
}
