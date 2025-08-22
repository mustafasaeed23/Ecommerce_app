import 'package:ecommerce/featuers/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CartItemWidget();
      },
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemCount: 10,
    );
  }
}
