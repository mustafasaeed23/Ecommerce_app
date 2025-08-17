import 'package:ecommerce/core/constants/assets.dart';
import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/banners_widget.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/brands_section.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(flex: 9, child: SearchWidget()),
                  SizedBox(width: 10.w),
                  Expanded(child: SvgPicture.asset(Assets.cartIcon)),
                ],
              ),
              SizedBox(height: 20.h),
              BannersCarousel(
                assets: const [Assets.banner1, Assets.banner2, Assets.banner3],
                height: 170.h,
                borderRadius: 15,
                viewportFraction: 1,
                autoPlay: false,

                autoPlayInterval: Duration(seconds: 4),
              ),
              SizedBox(height: 20.h),
              Text(
                "Categories",
                style: FontsStyle.semiBold.copyWith(
                  fontSize: 18.r,
                  color: AppColors.mainColor,
                ),
              ),
              SizedBox(height: 10.h),
              CategoriesSection(),
              SizedBox(height: 20.h),
              Text(
                "Brands",
                style: FontsStyle.semiBold.copyWith(
                  fontSize: 18.r,
                  color: AppColors.mainColor,
                ),
              ),
              BrandsSection(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
