import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:ecommerce/featuers/wishlist/presentation/widgets/wishList_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  } else if (state is WishlistError ||
                      state is AddToWishListError) {
                    final message = state is WishlistError
                        ? state.message
                        : (state as AddToWishListError).message;
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Error: $message")));
                  }
                },
                builder: (context, state) {
                  if (state is WishlistLoading ||
                      state is AddToWishListLoading) {
                    return const LoadingWidget();
                  } else if (state is WishlistLoaded) {
                    if (state.wishlistProducts.isEmpty) {
                      return const Center(
                        child: Text("Your wishlist is empty"),
                      );
                    }
                    return ListView.separated(
                      itemCount: state.wishlistProducts.length,
                      separatorBuilder: (_, __) => SizedBox(height: 15.h),
                      itemBuilder: (context, index) {
                        return WishlistItemWidget(
                          entity: state.wishlistProducts[index],
                        );
                      },
                    );
                  }
                  return const Center(child: Text("Your wishlist is empty"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
