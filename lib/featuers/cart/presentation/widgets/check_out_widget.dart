import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({super.key, required this.totalPrice});

  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Price",
                style: FontsStyle.medium.copyWith(
                  fontSize: 16.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                "EGP $totalPrice",
                style: FontsStyle.medium.copyWith(
                  fontSize: 18.sp,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: CustomButton(
              onPressed: () {},
              buttonText: "Check out",
              borderRadius: 20.r,
              buttonColor: AppColors.mainColor,
              textColor: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
