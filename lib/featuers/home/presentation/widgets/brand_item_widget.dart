import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandItemWidget extends StatelessWidget {
  final BrandEntity brandEntity;
  const BrandItemWidget({super.key, required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.transparent, // optional background
            child: ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: brandEntity.image,
                fit: BoxFit.contain,
                width: 80.r,
                height: 80.r,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(strokeWidth: 2),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, size: 40),
              ),
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            textAlign: TextAlign.center,
            brandEntity.name,
            style: FontsStyle.regular.copyWith(
              fontSize: 12.r,
              color: AppColors.mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
