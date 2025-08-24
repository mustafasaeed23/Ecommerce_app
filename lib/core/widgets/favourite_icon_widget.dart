import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/utils/dialogs.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key, this.isFavourite, this.onTap});

  final bool? isFavourite;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocListener<WishlistCubit, WishlistState>(
      listener: (context, state) {
        if (state is AddToWishListSuccess) {
          Dialogs.showMessageDialog("Item added to wishlist");
        }
      },
      child: InkWell(
        onTap:onTap ,
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
            child:  
             SvgPicture.asset(
              isFavourite == true
                  ? Assets.selectedHeartIcon
                  : Assets.unSelectedHeartIcon,
            ),
          ),
        ),
      ),
    );
  }
}
