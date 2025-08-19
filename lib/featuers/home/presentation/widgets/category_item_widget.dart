import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItemWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 70.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          // Image.asset(Assets.categoriesImage),
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.transparent, // optional background
            child: ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                imageUrl: categoryEntity.image,
                fit: BoxFit.fitHeight,
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
          Center(
            child: Text(
              textAlign: TextAlign.center,
              categoryEntity.name,
              style: FontsStyle.regular.copyWith(
                fontSize: 12.r,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
