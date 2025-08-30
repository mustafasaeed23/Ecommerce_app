import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/utils/dialogs.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is AddToWishListSuccess) {
          Dialogs.customToast(context, "Added to wishlist");
        } else if (state is RemoveFromWishListSuccess) {
          Dialogs.customToast(context, "Removed from wishlist");
        }
      },
      builder: (context, state) {
        final wishlistCubit = context.read<WishlistCubit>();
        final isFavourite = wishlistCubit.isProductInWishlist(productId);

        return InkWell(
          onTap: () {
            if (isFavourite) {
              context.read<WishlistCubit>().removeFromWishList(productId);
            } else {
              context.read<WishlistCubit>().addToWishlist(productId);
            }
          },
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                isFavourite
                    ? Assets.selectedHeartIcon
                    : Assets.unSelectedHeartIcon,
              ),
            ),
          ),
        );
      },
    );
  }
}
