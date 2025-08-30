import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:ecommerce/featuers/wishlist/presentation/widgets/wishList_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // fetch wishlist on open
    context.read<WishlistCubit>().getUserWishlist();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
        child: Column(
          children: [
            const SearchWidget(),
            SizedBox(height: 15.h),
            Expanded(
              child: BlocConsumer<WishlistCubit, WishlistState>(
                listener: (context, state) {
                  if (state is AddToWishListSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Added to wishlist ✅")),
                    );
                  }
                  if (state is RemoveFromWishListSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Removed from wishlist ❌")),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is WishlistLoading ||
                      state is AddToWishListLoading ||
                      state is RemoveFromWishListLoading) {
                    return const LoadingWidget();
                  }

                  if (state is WishlistLoaded) {
                    if (state.wishlistProducts.isNotEmpty) {
                      return ListView.separated(
                        itemCount: state.wishlistProducts.length,
                        separatorBuilder: (_, __) => SizedBox(height: 15.h),
                        itemBuilder: (context, index) {
                          return WishlistItemWidget(
                            entity: state.wishlistProducts[index],
                          );
                        },
                      );
                    } else {
                      // Empty state
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 200.h,
                              child: Lottie.asset(
                                Assets.emptyBox,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Your wishlist is empty",
                              style: FontsStyle.semiBold.copyWith(
                                fontSize: 13.r,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }

                  return const LoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
