import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeSelectorWidget extends StatelessWidget {
  final List<int> sizes;
  final int selectedSize;
  final ValueChanged<int> onSizeChanged;

  const SizeSelectorWidget({
    super.key,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: FontsStyle.medium.copyWith(
            fontSize: 18.r,
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: sizes.map((size) {
            return GestureDetector(
              onTap: () => onSizeChanged(size),
              child: Container(
                margin:  EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: size == selectedSize ? AppColors.mainColor : Colors.grey[200],
                  border: Border.all(
                    color: size == selectedSize
                        ? AppColors.mainColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Text(
                  '$size',
                  style: TextStyle(
                    color: size == selectedSize ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
