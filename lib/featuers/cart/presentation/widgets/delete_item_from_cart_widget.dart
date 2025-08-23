import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/utils/dialogs.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DeleteItemFromCartWidget extends StatelessWidget {
  const DeleteItemFromCartWidget({
    super.key,
    required this.cartCubit,
    required this.cartItemEntity,
  });

  final CartCubit cartCubit;
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is DeleteItemSuccess) {
          Dialogs.customToast(context, "Item deleted successfully");
        } else if (state is DeleteItemError) {
          Dialogs.customToast(context, state.message);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: InkWell(
          onTap: () {
            cartCubit.deleteItem(cartItemEntity.product.sId);
          },
          borderRadius: BorderRadius.circular(10.r),
          child: SvgPicture.asset(Assets.deleteIcon, width: 20.w, height: 20.w),
        ),
      ),
    );
  }
}
