import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
    this.decrementCart,
    this.incrementCart,
    this.cartItemCount,
  });

  final VoidCallback? decrementCart;
  final VoidCallback? incrementCart;
  final String? cartItemCount;

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  bool _selfRequested = false;

  void _onDec() {
    setState(() => _selfRequested = true);
    widget.decrementCart!();
  }

  void _onInc() {
    setState(() => _selfRequested = true);
    widget.incrementCart!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: 122.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: BlocSelector<CartCubit, CartState, bool>(
        selector: (s) => s is UpdateCartLoading, // global loading (no itemId)
        builder: (context, isGlobalLoading) {
          // Only spin if this row initiated the update.
          final isBusy = isGlobalLoading && _selfRequested;

          // When loading ends, clear the local flag so other rows won't affect us.
          if (!isGlobalLoading && _selfRequested) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) setState(() => _selfRequested = false);
            });
          }

          if (isBusy) {
            return const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.whiteColor,
                ),
              ),
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: isBusy ? null : _onDec,
                child: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                widget.cartItemCount ?? '',
                style: FontsStyle.bold.copyWith(
                  fontSize: 16.r,
                  color: AppColors.whiteColor,
                ),
              ),
              InkWell(
                onTap: isBusy ? null : _onInc,
                child: const Icon(
                  Icons.add_circle_outline_outlined,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
