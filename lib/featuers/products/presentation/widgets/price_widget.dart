import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';

class PriceWidget extends StatelessWidget {
  final int price;
  final int priceAfterDiscount;

  /// Choose horizontal (Row) or vertical (Column)
  final Axis direction;

  /// Gap between current and old price
  final double spacing;

  /// Align text across the cross axis
  final CrossAxisAlignment crossAxisAlignment;

  const PriceWidget({
    super.key,
    required this.price,
    required this.priceAfterDiscount,
    this.direction = Axis.horizontal,       // default: Row
    this.spacing = 6.0,                     // default gap
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDiscount =
        priceAfterDiscount > 0 && priceAfterDiscount < price;

    Widget currentPrice() => Text(
          "EGP ${hasDiscount ? priceAfterDiscount : price}",
          style: FontsStyle.medium.copyWith(
            fontSize: 15.r,
            color: AppColors.mainColor,
            fontWeight: FontWeight.w600,
          ),
        );

    Widget oldPrice() => Text(
          "EGP $price",
          style: FontsStyle.medium.copyWith(
            fontSize: 13.r,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        );

    final spacer = direction == Axis.horizontal
        ? SizedBox(width: spacing.w)
        : SizedBox(height: spacing.h);

    return Flex(
      direction: direction,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        currentPrice(),
        if (hasDiscount) ...[
          spacer,
          oldPrice(),
        ],
      ],
    );
  }
}
