import 'package:ecommerce/core/di/service_locator.dart';
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
    var wishlistCubit = serviceLocator.get<WishlistCubit>();
    return BlocProvider(
      create: (context) => wishlistCubit..getUserWishlist(),
      child: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
          child: Column(
            children: [
              SearchWidget(),
              SizedBox(height: 15.h),
              BlocBuilder<WishlistCubit, WishlistState>(
                builder: (context, state) {
                  if (state is WishlistLoading) {
                    LoadingWidget();
                  } else if (state is WishlistLoaded) {
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return WishlistItemWidget(
                            entity: wishlistCubit.wishlistProductEntity[index],
                            wishlistCubit: wishlistCubit,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15.h),
                        itemCount: wishlistCubit.wishlistProductEntity.length,
                      ),
                    );
                  } else if (state is WishlistError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
