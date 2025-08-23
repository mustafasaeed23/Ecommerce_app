import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/cart_list.dart';
import 'package:ecommerce/featuers/cart/presentation/widgets/check_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartCubit = serviceLocator.get<CartCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cartCubit..getCart(),
      child: Scaffold(
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
            InkWell(
              onTap: () {},
              child: Icon(Icons.more_vert, color: AppColors.mainColor),
            ),
            SizedBox(width: 15.w),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartLoading) {
                  return LoadingWidget();
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CartItemWidget(
                              cartItemEntity:
                                  cartCubit.cartEntity.products[index],
                              cartCubit: cartCubit,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemCount: cartCubit.cartEntity.products.length,
                        ),
                      ),
                      CheckOutWidget(
                        totalPrice: cartCubit.cartEntity.totalCartPrice
                            .toString(),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
