import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/cart_list.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/check_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(Assets.arrowBackIcon),
          ),
        ),
        title: Text(
          "Cart",
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
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              child: const CartList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100.h,
                padding: EdgeInsets.all(15.w),
                color: Colors.white, // background for clarity
                child: CheckOutWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
