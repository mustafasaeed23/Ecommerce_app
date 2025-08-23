import 'package:ecommerce/core/theme/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class FavouriteIconWidget extends StatelessWidget {
  const FavouriteIconWidget({super.key, this.isFavourite});

  final bool? isFavourite;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          isFavourite == true
              ? Assets.selectedHeartIcon
              : Assets.unSelectedHeartIcon,
        ),
      ),
    );
  }
}
